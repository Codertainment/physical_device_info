import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:physical_device_info/physical_device_info_method_channel.dart';

void main() {
  MethodChannelPhysicalDeviceInfo platform = MethodChannelPhysicalDeviceInfo();
  const MethodChannel channel = MethodChannel('physical_device_info');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return {
        "width": -1,
        "height": -1,
      };
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getDeviceResolution', () async {
    expect(await platform.getDeviceResolution(), const Size(-1, -1));
  });
}
