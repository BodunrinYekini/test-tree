#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#


$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
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
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/manifests/vendor/manifest/,$(TARGET_COPY_OUT_VENDOR)/etc/vintf/manifest) 

PRODUCT_PACKAGES += \
    fstab.ums9230_1h10 \
    init.cali.rc \
    init.ram.gms.rc \
    init.ram.native.rc \
    init.ram.rc \
    init.storage.rc \
    init.ums9230_1h10.rc \
    init.ums9230_1h10.usb.rc \
    init.ums9230_1h10_go.rc \
    init.ums9230_1h10_go.usb.rc \
    init.ums9230_4h10.rc \
    init.ums9230_4h10.usb.rc \
    init.ums9230_4h10_go.rc \
    init.ums9230_4h10_go.usb.rc \
    init.ums9230_4h10_go_AG801.rc \
    init.ums9230_4h10_go_AG801.usb.rc \
    init.zramwb.rc \


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.ums9230_1h10:$(TARGET_COPY_OUT_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.ums9230_1h10


PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.trusty \
	android.hardware.health-service.example \
	android.hardware.thermal@2.0-service.mock \
	android.hardware.power-service.example


PRODUCT_SHIPPING_API_LEVEL := 33

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

PRODUCT_CHARACTERISTICS := default

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)