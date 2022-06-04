#include "include/physical_device_info/physical_device_info_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "physical_device_info_plugin.h"

void PhysicalDeviceInfoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  physical_device_info::PhysicalDeviceInfoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
