#
# Copyright (C) 2019-2024 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Building with minimal manifest (for OrangeFox)
ALLOW_MISSING_DEPENDENCIES := true

DEVICE_PATH := device/amazon/mustang

# Headers
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Inherit from the proprietary versions (skip for recovery-only builds)
ifeq ($(wildcard vendor/amazon/mt8163/BoardConfigVendor.mk),vendor/amazon/mt8163/BoardConfigVendor.mk)
include vendor/amazon/mt8163/BoardConfigVendor.mk
endif
ifeq ($(wildcard vendor/amazon/mustang/BoardConfigVendor.mk),vendor/amazon/mustang/BoardConfigVendor.mk)
include vendor/amazon/mustang/BoardConfigVendor.mk
endif

# Bootanimation
TARGET_SCREEN_WIDTH := 1024
TARGET_SCREEN_HEIGHT := 600

# Platform
TARGET_BOARD_PLATFORM := mt8163
TARGET_BOARD_PLATFORM_GPU := mali-720mp2

# Bootloader
TARGET_NO_BOOTLOADER := true

# Architecture (64-bit primary with 32-bit compat)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_VARIANT := cortex-a7
TARGET_2ND_CPU_ABI := armeabi-v7a

TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_SMP := true

# Kernel Config
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_KERNEL_BASE := 0x40080000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x07f80000
BOARD_RAMDISK_OFFSET := 0x03400000
BOARD_SECOND_OFFSET := 0x00e80000

BOARD_RAMDISK_USE_LZ4 := true

BOARD_MKBOOTIMG_ARGS := \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --second_offset $(BOARD_SECOND_OFFSET)   \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/amazon/mustang
TARGET_KERNEL_CONFIG := lineageos_mustang_defconfig
TARGET_KERNEL_VARIANT_CONFIG := lineageos_mustang_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
TARGET_KERNEL_OPTIONAL_LD := true
TARGET_KERNEL_CLANG_COMPILE := false
AMAZON_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += enforcing=0
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware

BOARD_HAS_MTK_HARDWARE := true

# Build Vendor Image
TARGET_COPY_OUT_VENDOR := vendor
BOARD_USES_VENDORIMAGE := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_METADATA_PARTITION := true

# Binder API version
TARGET_USES_64_BIT_BINDER := true

BOARD_NO_SECURE_DISCARD := true

# Bootanimation
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# WIFI
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# BT
BOARD_HAS_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3151745024
BOARD_CACHEIMAGE_PARTITION_SIZE := 499261440
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 224350208
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11633933824
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USERIMAGES_USE_EXT4 := true

BLOCK_BASED_OTA := true

# Seccomp filters
BOARD_SECCOMP_POLICY := $(DEVICE_PATH)/configs/seccomp
# Skip device sepolicy for recovery-only builds (OF/TWRP) - too many missing types in AOSP 14+
ifeq ($(wildcard vendor/twrp/config/common.mk),)
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private
endif

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file

# Software Gatekeeper
BOARD_USE_SOFT_GATEKEEPER := true

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode

# Manifest
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE   := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/device_framework_compatibility_matrix.xml

# OTA assert
TARGET_OTA_ASSERT_DEVICE:= mustang

# Display
TARGET_SCREEN_DENSITY := 160

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Audio
USE_XML_AUDIO_POLICY_CONF := 1
USE_CUSTOM_AUDIO_POLICY := 1

# Exclude AudioFx
TARGET_EXCLUDES_AUDIOFX := true

# Camera
TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES := true
USE_CAMERA_STUB := true

#BACKLIGHTS
TARGET_PROVIDES_LIBLIGHT := true

# Graphics
TARGET_USES_HWC2 := true

# Treble
SELINUX_IGNORE_NEVERALLOWS := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

# APEX - flatten APEXes to bypass eBPF/kernel version requirements on 4.9 kernel
OVERRIDE_TARGET_FLATTEN_APEX := true

# LMKD stats logging
TARGET_LMKD_STATS_LOG := true

#SENSORS
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-12-05

# TWRP
ifneq (,$(strip $(wildcard bootable/recovery-twrp/twrp.cpp)))
RECOVERY_VARIANT := twrp
WITH_TWRP := true
endif
TARGET_RECOVERY_DEVICE_DIRS += device/amazon/mustang/twrp
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/twrp/recovery/root/recovery.fstab
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone2/temp
DEVICE_RESOLUTION := 600x1024
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_USE_SYSTEM_VOLD := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 128
TW_AMONET := true
TW_THEME := portrait_hdpi
TW_DEFAULT_BACKUP_LIST := "/system_image;/vendor_image;/data;/boot;"
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TARGET_USES_MKE2FS := true
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en

#Use dlmalloc instead of jemalloc for mallocs
MALLOC_SVELTE := true

BUILD_BROKEN_DUP_RULES := true

# Disable API check
WITHOUT_CHECK_API := true

# Disable configstore (deprecated in A12+)
BOARD_USES_CONFIGSTORE := false
