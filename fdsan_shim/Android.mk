LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libnofdsan
LOCAL_SRC_FILES := libnofdsan.c
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)
