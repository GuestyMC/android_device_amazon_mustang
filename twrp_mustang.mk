#
# Copyright (C) 2024 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/amazon/mustang

# Inherit from base configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Configure twrp common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# Device-specific OrangeFox configuration
$(call inherit-product, $(DEVICE_PATH)/fox_mustang.mk)

# Release name
PRODUCT_RELEASE_NAME := mustang

## Device identifier
PRODUCT_DEVICE := mustang
PRODUCT_NAME := twrp_mustang
PRODUCT_BRAND := Amazon
PRODUCT_MODEL := Fire 7 (2019)
PRODUCT_MANUFACTURER := Amazon

# Assert
TARGET_OTA_ASSERT_DEVICE := mustang

# API
PRODUCT_SHIPPING_API_LEVEL := 28
