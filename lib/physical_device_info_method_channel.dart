import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'physical_device_info_platform_interface.dart';

/// An implementation of [PhysicalDeviceInfoPlatform] that uses method channels.
class MethodChannelPhysicalDeviceInfo extends PhysicalDeviceInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('physical_device_info');

  @override
  Future<Size?> getDeviceResolution() async {
    final dimensionMap = await methodChannel.invokeMethod<Map>('getDeviceResolution');
    return Size(dimensionMap?['width']?.toDouble() ?? 0, dimensionMap?['height']?.toDouble() ?? 0);
  }
}
