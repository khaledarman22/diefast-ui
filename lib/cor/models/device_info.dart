import 'package:dietfast1/cor/enums/device_type.dart';
import 'package:flutter/material.dart';

class DeviceInfo {
  final Orientation? orientation;
  final DeviceType? deviceType;
  final double? screenWidth;
  final double? screenHieght;
  final double? localWidth;
  final double? localHieght;

  DeviceInfo(
      {this.orientation,
      this.deviceType,
      this.screenWidth,
      this.screenHieght,
      this.localWidth,
      this.localHieght});
}
