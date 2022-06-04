import 'dart:ui';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'physical_device_info_method_channel.dart';

abstract class PhysicalDeviceInfoPlatform extends PlatformInterface {
  /// Constructs a PhysicalDeviceInfoPlatform.
  PhysicalDeviceInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static PhysicalDeviceInfoPlatform _instance = MethodChannelPhysicalDeviceInfo();

  /// The default instance of [PhysicalDeviceInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelPhysicalDeviceInfo].
  static PhysicalDeviceInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PhysicalDeviceInfoPlatform] when
  /// they register themselves.
  static set instance(PhysicalDeviceInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Size?> getDeviceResolution() {
    throw UnimplementedError('DeviceResolution() has not been implemented.');
  }
}
