/// uikit-${library_type}-${error_type}-${error_code}
/// 3-xx-xxx-xxx
///
/// library_type: {
///   00:uikit;
///
///   01:signaling plugin;
///   02:adapter plugin;
///   03:beauty plugin;
///
///   10:call prebuilt;
///   11:live audio room prebuilt;
///   12:live streaming prebuilt;
///   13:video conference prebuilt;
///   14:zim-kit;
/// }
///
/// --------------------------------
///
/// 3-02-000-000
///
/// error type: {
///   internal(001): 302001-xxx
/// }
class ZegoAdapterErrorCode {
  /// Execution successful.
  static const int success = 0;

  /// Description:
  /// static const int XXX = 302000001;
}
