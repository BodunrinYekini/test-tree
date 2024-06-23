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
system_ext_manifest.xml
# product_compatibility_matrix.xml \
# product_manifest.xml \
# system_manifest.xml \
# system_compatibility_matrix.xml \
# vendor_compatibility_matrix.xml

LOCAL_MODULE := strip_packages
LOCAL_MODULE_TAGS := optional
PACKAGES.$(LOCAL_MODULE).OVERRIDES := $(strip $(UNWANTED_OVERRIDE_PACKAGES))
include $(BUILD_PHONY_PACKAGE)