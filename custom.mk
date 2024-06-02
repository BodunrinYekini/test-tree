# Base modules and settings for recovery.
PRODUCT_PACKAGES += \
    adbd.recovery \
    android.hardware.health@2.0-impl-default.recovery \
    cgroups.recovery.json \
    charger.recovery \
    init_second_stage.recovery \
    ld.config.recovery.txt \
    linker.recovery \
    otacerts.recovery \
    recovery \
    servicemanager.recovery \
    shell_and_utilities_recovery \
    watchdogd.recovery \
# These had been pulled in via init_second_stage.recovery, but may not be needed.
PRODUCT_HOST_PACKAGES += \
    e2fsdroid \
    mke2fs \
    sload_f2fs \
    make_f2fs \
PRODUCT_HOST_PACKAGES += \
    icu-data_host_i18n_apex
# Base modules and settings for the vendor partition.
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service \
    boringssl_self_test_vendor \
    dumpsys_vendor \
    fs_config_files_nonsystem \
    fs_config_dirs_nonsystem \
    gralloc.default \
    group_odm \
    group_vendor \
    init_vendor \
    libbundlewrapper \
    libclearkeycasplugin \
    libdownmix \
    libdrmclearkeyplugin \
    libdynproc \
    libeffectproxy \
    libeffects \
    libhapticgenerator \
    libldnhncr \
    libreference-ril \
    libreverbwrapper \
    libril \
    libvisualizer \
    passwd_odm \
    passwd_vendor \
    selinux_policy_nonsystem \
    shell_and_utilities_vendor \
# Base module when shipping api level is less than or equal to 29
PRODUCT_PACKAGES_SHIPPING_API_LEVEL_29 += \
    android.hardware.configstore@1.1-service \
    vndservice \
    vndservicemanager \
# VINTF data for vendor image
PRODUCT_PACKAGES += \
    vendor_compatibility_matrix.xml \
# Base modules and settings for the debug ramdisk, which is then packed
# into a boot-debug.img and a vendor_boot-debug.img.
PRODUCT_PACKAGES += \
    adb_debug.prop \
    userdebug_plat_sepolicy.cil
    

# /vendor packages
PRODUCT_PACKAGES += \
    libaudiopreprocessing \
    

# /vendor packages
PRODUCT_PACKAGES += \
    audio.primary.default \
    local_time.default \
    power.default \
    vibrator.default \

