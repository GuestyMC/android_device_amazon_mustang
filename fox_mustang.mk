#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

# Screen settings (1024x600 landscape)
OF_SCREEN_H := 600
OF_STATUS_H := 0
OF_HIDE_NOTCH := 0
OF_CLOCK_POS := 1
OF_STATUS_INDENT_LEFT := 0
OF_STATUS_INDENT_RIGHT := 0
OF_ALLOW_DISABLE_NAVBAR := 1
OF_USE_GREEN_LED := 0

# Quick backup list
OF_QUICK_BACKUP_LIST := /boot;/system_image;/vendor_image;/data;

# Partition tools
OF_ENABLE_LPTOOLS := 0
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1

# Number of list options before scrollbar creation
OF_OPTIONS_LIST_NUM := 8

# Data format stuff
OF_UNBIND_SDCARD_F2FS := 0
OF_WIPE_METADATA_AFTER_DATAFORMAT := 0
OF_BIND_MOUNT_SDCARD_ON_FORMAT := 0
OF_UNMOUNT_SDCARDS_BEFORE_REBOOT := 1
OF_LOOP_DEVICE_ERRORS_TO_LOG := 1

# LZ4 compression
OF_USE_LZ4_COMPRESSION := 1

# Build all the partition tools
OF_ENABLE_ALL_PARTITION_TOOLS := 0

# Skip FBE decryption (device uses FDE)
OF_SKIP_FBE_DECRYPTION := 1

# Use lockscreen button instead of swipe
OF_USE_LOCKSCREEN_BUTTON := 0

# Default timezone
OF_DEFAULT_TIMEZONE := GMT0

# Force prebuilt kernel (we build our own)
OF_FORCE_PREBUILT_KERNEL := 0

# Disable automatic rebooting after openrecoveryscript finishes
OF_DISABLE_ORS_AUTO_REBOOT := 0

# Enable FRP addon
OF_ENABLE_FRP_ADDON := 1

# Maintainer
OF_MAINTAINER := GuestyMC

# Disable flashlight (no LED on this device)
OF_FLASHLIGHT_ENABLE := 0

# Disable block operations after ROM flash
OF_BLOCK_OPERATIONS_AFTER_ROM_FLASH := 0

# Amonet support
TW_AMONET := true
