include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := PowerSaveModeLauncherPrebuilt
LOCAL_SRC_FILES := modules/system_ext/priv-app/OmacpPrebuilt/PowerSaveModeLauncherPrebuilt/PowerSaveModeLauncherPrebuilt.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_PATH := $(TARGET_OUT_SYSTEM_EXT)/priv-app/OmacpPrebuilt/PowerSaveModeLauncherPrebuilt
LOCAL_IS_RUNTIME_RESOURCE_OVERLAY := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
UNWANTED_OVERRIDE_PACKAGES := \
    rild \
    audio.primary.default \
    local_time.default \
    power.default \
    vibrator.default \
    libaudiopreprocessing \
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
    e2fsdroid \
    mke2fs \
    sload_f2fs \
    make_f2fs \
    icu-data_host_i18n_apex \
    android.hardware.cas@1.2-service \
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
    android.hardware.configstore@1.1-service \
    vndservice \
    vndservicemanager \
    vendor_compatibility_matrix.xml \
    adb_debug.prop \
    userdebug_plat_sepolicy.cil
 
LOCAL_MODULE := strip_vendor_packages
LOCAL_MODULE_TAGS := optional
PACKAGES.$(LOCAL_MODULE).OVERRIDES := $(strip $(UNWANTED_OVERRIDE_PACKAGES))
include $(BUILD_PHONY_PACKAGE)