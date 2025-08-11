/// CallKit Action 数据基类
/// 所有具体的 Action 数据类都应该继承此类
abstract class ZegoSignalingPluginCallKitActionData {
  /// 通话的唯一标识符
  final String callUUID;

  ZegoSignalingPluginCallKitActionData({required this.callUUID});
}

/// 开始通话 Action 数据
class ZegoSignalingPluginCallKitStartActionData
    extends ZegoSignalingPluginCallKitActionData {
  /// 远程用户的句柄
  final String handle;

  /// 联系人标识符
  final String contactIdentifier;

  /// 是否为视频通话
  final bool video;

  ZegoSignalingPluginCallKitStartActionData({
    required String callUUID,
    required this.handle,
    required this.contactIdentifier,
    required this.video,
  }) : super(callUUID: callUUID);
}

/// 接听通话 Action 数据
class ZegoSignalingPluginCallKitAnswerActionData
    extends ZegoSignalingPluginCallKitActionData {
  ZegoSignalingPluginCallKitAnswerActionData({required String callUUID})
      : super(callUUID: callUUID);
}

/// 结束通话 Action 数据
class ZegoSignalingPluginCallKitEndActionData
    extends ZegoSignalingPluginCallKitActionData {
  ZegoSignalingPluginCallKitEndActionData({required String callUUID})
      : super(callUUID: callUUID);
}

/// 设置通话保持状态 Action 数据
class ZegoSignalingPluginCallKitSetHeldActionData
    extends ZegoSignalingPluginCallKitActionData {
  /// 是否保持通话
  final bool onHold;

  ZegoSignalingPluginCallKitSetHeldActionData({
    required String callUUID,
    required this.onHold,
  }) : super(callUUID: callUUID);
}

/// 设置静音状态 Action 数据
class ZegoSignalingPluginCallKitSetMutedActionData
    extends ZegoSignalingPluginCallKitActionData {
  /// 是否静音
  final bool muted;

  ZegoSignalingPluginCallKitSetMutedActionData({
    required String callUUID,
    required this.muted,
  }) : super(callUUID: callUUID);
}

/// 设置群组通话 Action 数据
class ZegoSignalingPluginCallKitSetGroupActionData
    extends ZegoSignalingPluginCallKitActionData {
  ZegoSignalingPluginCallKitSetGroupActionData({required String callUUID})
      : super(callUUID: callUUID);
}

/// 播放 DTMF 音调 Action 数据
class ZegoSignalingPluginCallKitPlayDTMFActionData
    extends ZegoSignalingPluginCallKitActionData {
  /// DTMF 数字
  final String digits;

  /// DTMF 类型
  final String type;

  ZegoSignalingPluginCallKitPlayDTMFActionData({
    required String callUUID,
    required this.digits,
    required this.type,
  }) : super(callUUID: callUUID);
}

/// 超时执行 Action 数据
class ZegoSignalingPluginCallKitTimedOutActionData
    extends ZegoSignalingPluginCallKitActionData {
  ZegoSignalingPluginCallKitTimedOutActionData({required String callUUID})
      : super(callUUID: callUUID);
}
