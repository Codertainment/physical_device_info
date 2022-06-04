#ifndef FLUTTER_PLUGIN_PHYSICAL_DEVICE_INFO_PLUGIN_H_
#define FLUTTER_PLUGIN_PHYSICAL_DEVICE_INFO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace physical_device_info {

class PhysicalDeviceInfoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PhysicalDeviceInfoPlugin();

  virtual ~PhysicalDeviceInfoPlugin();

  // Disallow copy and assign.
  PhysicalDeviceInfoPlugin(const PhysicalDeviceInfoPlugin&) = delete;
  PhysicalDeviceInfoPlugin& operator=(const PhysicalDeviceInfoPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace physical_device_info

#endif  // FLUTTER_PLUGIN_PHYSICAL_DEVICE_INFO_PLUGIN_H_
