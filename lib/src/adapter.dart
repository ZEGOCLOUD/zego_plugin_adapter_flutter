import 'package:flutter/foundation.dart';

import 'package:zego_plugin_adapter/src/adapter.dart';

export 'beauty/beauty.dart';
export 'callkit/callkit.dart';
export 'defines.dart';
export 'signaling/signaling.dart';

/// @nodoc
class ZegoPluginAdapterImpl {
  /// plugin installed notify
  final pluginsInstallNotifier = ValueNotifier<List<ZegoUIKitPluginType>>([]);

  /// plugin instance map
  Map<ZegoUIKitPluginType, IZegoUIKitPlugin?> plugins = {
    for (var type in ZegoUIKitPluginType.values) type: null
  };

  /// version
  String getVersion() => 'zego_plugin_adapter: 2.13.5';

  /// install target plugins
  void installPlugins(List<IZegoUIKitPlugin> instances) {
    for (final item in instances) {
      final itemType = item.getPluginType();
      if (plugins[itemType] != null) {
        debugPrint('plugin type:$itemType already exists '
            '(${plugins[itemType].hashCode}), '
            'will update plugin instance ${item.hashCode}');
      }

      plugins[itemType] = item;
      debugPrint('plugin type:$itemType install '
          '(${plugins[itemType].hashCode})');
    }

    pluginsInstallNotifier.value = plugins.keys.toList();
  }

  /// uninstall target plugins
  void uninstallPlugins(List<IZegoUIKitPlugin> instances) {
    for (final item in instances) {
      final itemType = item.getPluginType();
      if (plugins[itemType] != null) {
        plugins.removeWhere((pluginType, plugin) {
          return itemType == pluginType;
        });
        debugPrint('plugin type:$itemType uninstalled');
      } else {
        debugPrint('plugin type:$itemType is not exists');
      }
    }

    pluginsInstallNotifier.value = plugins.keys.toList();
  }

  /// signaling plugin instance
  ZegoSignalingPluginInterface? get signalingPlugin {
    final ret = plugins[ZegoUIKitPluginType.signaling];
    if (ret == null) {
      debugPrint('signalingPlugin is null');
    }
    return ret! as ZegoSignalingPluginInterface;
  }

  /// callkit plugin instance
  ZegoCallKitInterface? get callkit {
    final ret = plugins[ZegoUIKitPluginType.callkit];
    if (ret == null) {
      debugPrint('callkit is null');
    }
    return ret! as ZegoCallKitInterface;
  }

  /// beauty plugin instance
  ZegoBeautyPluginInterface? get beautyPlugin {
    final ret = plugins[ZegoUIKitPluginType.beauty];
    if (ret == null) {
      debugPrint('beautyPlugin is null');
    }
    return ret! as ZegoBeautyPluginInterface;
  }

  /// get specified plugin instance
  IZegoUIKitPlugin? getPlugin(ZegoUIKitPluginType type) {
    debugPrint('getPlugin: $type');
    return plugins[type];
  }
}
