#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),aleph)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif


include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := RemoveApps

# It overrrides packages to avoid their addition to the ROM
LOCAL_OVERRIDES_PACKAGES := \
	com.android.hardware.cas \

include $(BUILD_PACKAGE)
