##########################################################################################
#
# Magisk Module Template Config Script
# by topjohnwu
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (config.sh)
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Configs
##########################################################################################

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
AUTOMOUNT=true

# Set to true if you need to load system.prop
PROPFILE=true

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=false

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  ui_print "*******************************"
  ui_print "      Xiaomi Natrium mods      "
  ui_print "*******************************"
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info about how Magic Mount works, and why you need this

REPLACE="
/system/bin/busybox
/system/etc/device_features/natrium.xml
/system/etc/gps.conf
/system/etc/izat.conf
/system/etc/lowi.conf
/system/etc/xtwifi.conf
/system/fonts/NotoColorEmoji.ttf
/system/media/audio/ui/camera_click.ogg
/system/media/audio/ui/camera_focus.ogg
/system/usr/keylayout/synaptics_dsx.kl
/system/vendor/bin/xtra-daemon
/system/vendor/lib64/libbt-vendor.so
"

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  set_perm_recursive  $MODPATH  0  0  0755  0644
  set_perm	$MODPATH/system/bin/busybox				0	0	0755
  set_perm	$MODPATH/system/vendor/bin/xtra-daemon	0	0	0755
}

##########################################################################################
# Custom Functions
##########################################################################################

# This file (config.sh) will be sourced by the main flash script after util_functions.sh
# If you need custom logic, please add them here as functions, and call these functions in
# update-binary. Refrain from adding code directly into update-binary, as it will make it
# difficult for you to migrate your modules to newer template versions.
# Make update-binary as clean as possible, try to only do function calls in it.

