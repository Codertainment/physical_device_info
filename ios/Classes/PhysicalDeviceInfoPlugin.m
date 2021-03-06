#import "PhysicalDeviceInfoPlugin.h"
#if __has_include(<physical_device_info/physical_device_info-Swift.h>)
#import <physical_device_info/physical_device_info-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "physical_device_info-Swift.h"
#endif

@implementation PhysicalDeviceInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPhysicalDeviceInfoPlugin registerWithRegistrar:registrar];
}
@end
