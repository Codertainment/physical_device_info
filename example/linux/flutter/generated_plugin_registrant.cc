//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <physical_device_info/physical_device_info_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) physical_device_info_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PhysicalDeviceInfoPlugin");
  physical_device_info_plugin_register_with_registrar(physical_device_info_registrar);
}
