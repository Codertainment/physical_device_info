import 'dart:ui';

import 'physical_device_info_platform_interface.dart';

class PhysicalDeviceInfo {
  Future<Size?> getDeviceResolution() {
    return PhysicalDeviceInfoPlatform.instance.getDeviceResolution();
  }
}
