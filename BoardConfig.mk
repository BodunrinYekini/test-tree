#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/ohrtech/aleph
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true
DONT_DEXPREOPT_PREBUILTS := true
BOARD_BOOT_HEADER_VERSION := 4
PRODUCT_ENFORCE_VINTF_MANIFEST := true

BOARD_VNDK_VERSION=current

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
boot \
dtbo \
l_agdsp \
l_deltanv \
l_fixnv1 \
l_fixnv2 \
l_gdsp \
l_ldsp \
l_modem \
mmcblk0boot1 \
odm \
pm_sys \
product \
sdc \
sml \
system \
system_ext \
teecfg \
trustos \
uboot \
vbmeta \
vbmeta_odm \
vbmeta_product \
vbmeta_system \
vbmeta_system_ext \
vbmeta_vendor \
vendor \
vendor_boot \
vendor_dlkm

BOARD_USES_RECOVERY_AS_BOOT :=

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ums9230_4h10_go
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 213

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 buildvariant=userdebug
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := aleph_defconfig
TARGET_KERNEL_SOURCE := kernel/ohrtech/aleph

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_BOOTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SUPER_PARTITION_GROUPS := ohrtech_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 4299161600
BOARD_OHRTECH_DYNAMIC_PARTITIONS_SIZE := 4294967296 # -4MB overhead
BOARD_AVB_ALGORITHM := SHA256_RSA2048
BOARD_AVB_ENABLE := true

#vendor_dlkm
BOARD_USES_VENDOR_DLKMIMAGE := true
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
BOARD_OHRTECH_DYNAMIC_PARTITIONS_PARTITION_LIST += vendor_dlkm
BOARD_AVB_VENDOR_DLKM_ALGORITHM := $(BOARD_AVB_ALGORITHM)

#vendor
BOARD_USES_VENDORIMAGE := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_COPY_OUT_VENDOR := vendor
BOARD_OHRTECH_DYNAMIC_PARTITIONS_PARTITION_LIST += vendor
BOARD_AVB_VENDOR_ALGORITHM := $(BOARD_AVB_ALGORITHM)

#odm
BOARD_USES_ODMIMAGE := true
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_COPY_OUT_ODM := odm
BOARD_OHRTECH_DYNAMIC_PARTITIONS_PARTITION_LIST += odm
BOARD_AVB_ODM_ALGORITHM := $(BOARD_AVB_ALGORITHM)

#product
BOARD_USES_PRODUCTIMAGE := true
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_COPY_OUT_PRODUCT := product
BOARD_OHRTECH_DYNAMIC_PARTITIONS_PARTITION_LIST += product
BOARD_AVB_PRODUCT_ALGORITHM := $(BOARD_AVB_ALGORITHM)

#system_ext
BOARD_USES_SYSTEM_EXTIMAGE := true
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
BOARD_OHRTECH_DYNAMIC_PARTITIONS_PARTITION_LIST += system_ext
BOARD_AVB_SYSTEM_EXT_ALGORITHM := $(BOARD_AVB_ALGORITHM)

#system
BOARD_USES_SYSTEMIMAGE := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_COPY_OUT_SYSTEM := system
BOARD_OHRTECH_DYNAMIC_PARTITIONS_PARTITION_LIST += system
BOARD_AVB_SYSTEM_ALGORITHM := $(BOARD_AVB_ALGORITHM)

BOARD_AVB_PRODUCT_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_PRODUCT_ADD_HASHTREE_FOOTER_ARGS += --flags 2



BOARD_AVB_VENDOR_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_VENDOR_ADD_HASHTREE_FOOTER_ARGS += --flags 0

BOARD_AVB_VENDOR_DLKM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_VENDOR_DLKM_ADD_HASHTREE_FOOTER_ARGS += --flags 0

BOARD_AVB_SYSTEM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_SYSTEM_ADD_HASHTREE_FOOTER_ARGS += --flags 0

BOARD_AVB_SYSTEM_EXT_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_SYSTEM_EXT_ADD_HASHTREE_FOOTER_ARGS += --flags 0

# BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
# BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
# BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
# BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 1

# BOARD_AVB_VENDOR_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
# BOARD_AVB_VENDOR_BOOT_ALGORITHM := SHA256_RSA4096
# BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
# BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 18

# BOARD_AVB_DTBO_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
# BOARD_AVB_DTBO_ALGORITHM := SHA256_RSA4096
# BOARD_AVB_DTBO_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
# BOARD_AVB_DTBO_ROLLBACK_INDEX_LOCATION := 6



# Platform
TARGET_BOARD_PLATFORM := ums9230

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_SYSTEM_DLKM_PROP += $(DEVICE_PATH)/system_dlkm.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_ODM_DLKM_PROP += $(DEVICE_PATH)/odm_dlkm.prop
TARGET_VENDOR_DLKM_PROP += $(DEVICE_PATH)/vendor_dlkm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.ums9230_1h10
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2023-09-05


BOARD_USES_RECOVERY_AS_BOOT :=
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE :=
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true


# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

#/vendor/etc/vintf/compatibility_matrix.xml
DEVICE_MATRIX_FILE += $(DEVICE_PATH)/vendor_compatibility_matrix.xml

#/product/etc/vintf/compatibility_matrix.xml 
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE+= $(DEVICE_PATH)/product_compatibility_matrix.xml 

#/odm/etc/vintf/manifest.xml
ODM_MANIFEST_FILES+= $(DEVICE_PATH)/odm_manifest.xml


# Inherit the proprietary files
include vendor/ohrtech/aleph/BoardConfigVendor.mk