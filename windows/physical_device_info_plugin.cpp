#include "physical_device_info_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>
#include "wtypes.h"

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <map>
#include <memory>
#include <sstream>

namespace physical_device_info {

// static
void PhysicalDeviceInfoPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "physical_device_info",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<PhysicalDeviceInfoPlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

PhysicalDeviceInfoPlugin::PhysicalDeviceInfoPlugin() {}

PhysicalDeviceInfoPlugin::~PhysicalDeviceInfoPlugin() {}

void PhysicalDeviceInfoPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name().compare("getDeviceResolution") == 0) {
    RECT desktop;
    // Get a handle to the desktop window
    const HWND hDesktop = GetDesktopWindow();
    // Get the size of screen to the variable desktop
    GetWindowRect(hDesktop, &desktop);

    std::map<flutter::EncodableValue, flutter::EncodableValue> resolutionMap;
    resolutionMap[flutter::EncodableValue("width")] = flutter::EncodableValue(desktop.right);
    resolutionMap[flutter::EncodableValue("height")] = flutter::EncodableValue(desktop.bottom);

    result->Success(flutter::EncodableValue(resolutionMap));
  } else {
    result->NotImplemented();
  }
}

}  // namespace physical_device_info
