import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:physical_device_info/physical_device_info.dart';
import 'package:physical_device_info/physical_device_info_platform_interface.dart';
import 'package:physical_device_info/physical_device_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPhysicalDeviceInfoPlatform with MockPlatformInterfaceMixin implements PhysicalDeviceInfoPlatform {
  @override
  Future<Size?> getDeviceResolution() => Future.value(const Size(-1, -1));
}

void main() {
  final PhysicalDeviceInfoPlatform initialPlatform = PhysicalDeviceInfoPlatform.instance;

  test('$MethodChannelPhysicalDeviceInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPhysicalDeviceInfo>());
  });

  test('getDeviceResolution', () async {
    PhysicalDeviceInfo physicalDeviceInfoPlugin = PhysicalDeviceInfo();
    MockPhysicalDeviceInfoPlatform fakePlatform = MockPhysicalDeviceInfoPlatform();
    PhysicalDeviceInfoPlatform.instance = fakePlatform;

    expect(await physicalDeviceInfoPlugin.getDeviceResolution(), const Size(-1, -1));
  });
}
