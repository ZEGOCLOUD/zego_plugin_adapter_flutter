part of 'adapter_service.dart';

typedef ZegoPluginAdapterMessageHandler = Function(
  AppLifecycleState appLifecycleState,
);

/// @nodoc
mixin ZegoSystemService {
  final _messageHandlerNotifier = ValueNotifier<AppLifecycleState>(
    AppLifecycleState.resumed,
  );
  final List<ZegoPluginAdapterMessageHandler> _messageHandlers = [];
  AppLifecycleListener? _lifecycleListener;

  /// init
  void initSystemService() {
    if (_lifecycleListener != null) {
      return;
    }

    ZegoAdapterLoggerService.logInfo(
      'init system service',
      tag: 'adapter',
      subTag: 'system service',
    );

    /// Let Flutter own the lifecycle channel and subscribe to the states it
    /// reports. Claiming `SystemChannels.lifecycle.setMessageHandler` here
    /// would take the only handler the channel has and force this service to
    /// re-dispatch the raw state through
    /// `WidgetsBinding.handleAppLifecycleStateChanged`, which skips the
    /// `hidden` state the framework inserts on the way to `paused`. Any
    /// `AppLifecycleListener` in the host app - the framework's own included -
    /// then hits its `previousState == AppLifecycleState.hidden` assertion
    /// with "Invalid state transition from inactive to paused".
    _messageHandlerNotifier.value =
        WidgetsBinding.instance.lifecycleState ?? AppLifecycleState.resumed;
    _lifecycleListener = AppLifecycleListener(
      onStateChange: _onAppLifecycleStateChanged,
    );
  }

  /// register a handler for app lifecycle state changes
  void registerMessageHandler(ZegoPluginAdapterMessageHandler handler) {
    ZegoAdapterLoggerService.logInfo(
      'register message handler:${handler.hashCode}',
      tag: 'adapter',
      subTag: 'system service',
    );

    _messageHandlers.add(handler);
  }

  /// unregister
  void unregisterMessageHandler(ZegoPluginAdapterMessageHandler handler) {
    ZegoAdapterLoggerService.logInfo(
      'unregister message handler:${handler.hashCode}',
      tag: 'adapter',
      subTag: 'system service',
    );

    _messageHandlers.remove(handler);
  }

  /// get microphone state notifier
  ValueNotifier<AppLifecycleState> getMessageHandlerNotifier() {
    return _messageHandlerNotifier;
  }

  void _onAppLifecycleStateChanged(AppLifecycleState state) {
    ZegoAdapterLoggerService.logInfo(
      'app lifecycle state:$state',
      tag: 'adapter',
      subTag: 'system service',
    );

    /// Iterate over a copy: a handler is allowed to unregister itself, or
    /// another handler, while it is being notified.
    for (final messageHandler
        in List<ZegoPluginAdapterMessageHandler>.of(_messageHandlers)) {
      messageHandler.call(state);
    }
    _messageHandlerNotifier.value = state;
  }
}
