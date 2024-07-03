#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#


$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults_common.mk)


DEVICE_PATH := device/ohrtech/aleph
TARGET_PREBUILT_KERNEL :=$(DEVICE_PATH)/prebuilts/kernel
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel


PRODUCT_PACKAGES += \
Launcher3QuickStep \
Provision \
Settings \
StorageManager \
SystemUI \
WallpaperCropper \
ThemePicker \
RemoteProvisioner \
CarrierConfig \
EmergencyInfo \
messaging

#PRODUCT_COPY_FILES += \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/manifests/vendor/manifest/,$(TARGET_COPY_OUT_VENDOR)/etc/vintf/manifest) \


PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.trusty \
	android.hardware.health-service.example


PRODUCT_SHIPPING_API_LEVEL := 33

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

PRODUCT_CHARACTERISTICS := default

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)