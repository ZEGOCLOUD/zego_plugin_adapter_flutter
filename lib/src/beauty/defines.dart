import 'dart:math';

import 'package:flutter/services.dart';

class ZegoBeautyPluginFaceDetectionData {
  double score;
  Point point;
  Size size;

  ZegoBeautyPluginFaceDetectionData(this.score, this.point, this.size);
}
