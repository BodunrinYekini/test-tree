#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/ohrtech/aleph

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

    
PRODUCT_PACKAGES += \
    linker.recovery \
    shell_and_utilities_recovery \
    adbd.vendor_ramdisk

TARGET_PREBUILT_KERNEL := device/ohrtech/aleph/prebuilts/kernel
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)
PRODUCT_PACKAGES += snapuserd_ramdisk
PRODUCT_PACKAGES +=\
    alephProductOverlay
# vendor overlay
# PRODUCT_COPY_FILES += \
# $(LOCAL_PATH)/vendor/overlay/MultiuserOverlays.apk:$(BUILD_PREBUILT)/MultiuserOverlays.apk
# $(LOCAL_PATH)/vendor/overlay/NetworkStackOverlayGo.apk:$(BUILD_PREBUILT)/overlay/NetworkStackOverlayGo.apk
# $(LOCAL_PATH)/vendor/overlay/NetworkStackOverlayGsi.apk:$(BUILD_PREBUILT)/overlay/NetworkStackOverlayGsi.apk
# $(LOCAL_PATH)/vendor/overlay/Settings__auto_generated_rro_vendor.apk:$(BUILD_PREBUILT)/overlay/Settings__auto_generated_rro_vendor.apk
# $(LOCAL_PATH)/vendor/overlay/TetheringConfigOverlayGo.apk:$(BUILD_PREBUILT)/overlay/TetheringConfigOverlayGo.apk
# $(LOCAL_PATH)/vendor/overlay/TetheringConfigOverlayGsi.apk:$(BUILD_PREBUILT)/overlay/TetheringConfigOverlayGsi.apk
# $(LOCAL_PATH)/vendor/overlay/unisoc_go_overlay_frameworks_res.apk:$(BUILD_PREBUILT)/overlay/unisoc_go_overlay_frameworks_res.apk
# $(LOCAL_PATH)/vendor/overlay/unisoc_overlay_frameworks_res.apk:$(BUILD_PREBUILT)/overlay/unisoc_overlay_frameworks_res.apk
# $(LOCAL_PATH)/vendor/overlay/AospBtOverlay/AospBtOverlay.apk:$(BUILD_PREBUILT)/overlay/AospBtOverlay/AospBtOverlay.apk
# $(LOCAL_PATH)/vendor/overlay/AospWifiOverlay_Marlin3/AospWifiOverlay_Marlin3.apk:$(BUILD_PREBUILT)/overlay/AospWifiOverlay_Marlin3/AospWifiOverlay_Marlin3.apk
# $(LOCAL_PATH)/vendor/overlay/AospWifiOverlay_Marlin3_Mainline/AospWifiOverlay_Marlin3_Mainline.apk:$(BUILD_PREBUILT)/overlay/AospWifiOverlay_Marlin3_Mainline/AospWifiOverlay_Marlin3_Mainline.apk
# $(LOCAL_PATH)/vendor/overlay/UniWifiOverlay_Marlin3/UniWifiOverlay_Marlin3.apk:$(BUILD_PREBUILT)/overlay/UniWifiOverlay_Marlin3/UniWifiOverlay_Marlin3.apk
#$(DEVICE_PATH)/configs/displayconfig/display_id_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_0.xml

# Display config
#PRODUCT_COPY_FILES += \
 $(LOCAL_PATH)/displayconfig/display_19260504575090817.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_19260504575090817.xml

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 33

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.example \

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true


# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    log_to_csv.sh \
    loading.sh \
    para.sh \
    total.sh \
    create_splloader_dual_slot_byname_path.sh \
    idlefast.sh \
    init.insmod.sh \
    setup_console.sh \
    zramwb.sh \

PRODUCT_PACKAGES += \
    fstab.cali \
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
    $(LOCAL_PATH)/rootdir/etc/fstab.ums9230_1h10:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.ums9230_1h10

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/ohrtech/aleph/aleph-vendor.mk)

# Hidl Service
PRODUCT_ENFORCE_VINTF_MANIFEST := true