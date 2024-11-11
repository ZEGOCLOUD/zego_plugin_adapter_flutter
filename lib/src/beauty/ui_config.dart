import 'package:flutter/material.dart';

/// Zego Beauty Plugin UI Config
class ZegoBeautyPluginUIConfig {
  Color? backgroundColor;

  Color? selectedIconBorderColor;
  Color? selectedIconDotColor;

  TextStyle? selectedTextStyle;
  TextStyle? normalTextStyle;

  TextStyle? sliderTextStyle;
  Color? sliderTextBackgroundColor;
  Color? sliderActiveTrackColor;
  Color? sliderInactiveTrackColor;
  Color? sliderThumbColor;
  double? sliderThumbRadius;

  Widget? backIcon;

  TextStyle? normalHeaderTitleTextStyle;
  TextStyle? selectHeaderTitleTextStyle;

  ZegoBeautyPluginUIConfig({
    this.backgroundColor = const Color.fromARGB(230, 9, 17, 28),
    this.selectedIconBorderColor = Colors.red,
    this.selectedIconDotColor = Colors.red,
    this.selectedTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
    this.normalTextStyle = const TextStyle(
      color: Color(0xffC4C4C4),
      fontSize: 12,
    ),
    this.sliderTextStyle = const TextStyle(
      color: Color(0xff1B1A1C),
      fontSize: 30,
      fontWeight: FontWeight.w400,
    ),
    this.sliderActiveTrackColor = Colors.red,
    this.sliderInactiveTrackColor = const Color.fromARGB(76, 0, 0, 0),
    this.sliderThumbColor = Colors.white,
    this.normalHeaderTitleTextStyle = const TextStyle(
      color: Color(0xffC4C4C4),
      fontSize: 12,
    ),
    this.selectHeaderTitleTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
  });
}
