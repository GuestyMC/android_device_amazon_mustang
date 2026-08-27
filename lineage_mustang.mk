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

$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/amazon/mustang/device.mk)

# Go-style memory optimizations for 1.5GB RAM device
$(call inherit-product, device/amazon/mustang/go_opt.mk)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_DEVICE := mustang
PRODUCT_NAME := lineage_mustang
PRODUCT_BRAND := google
PRODUCT_MODEL := Fire
PRODUCT_BOARD := mustang
PRODUCT_MANUFACTURER := amzn

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_WIDTH := 1024
TARGET_SCREEN_HEIGHT := 600
