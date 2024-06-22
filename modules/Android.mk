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