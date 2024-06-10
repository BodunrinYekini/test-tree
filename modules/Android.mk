include $(CLEAR_VARS)
LOCAL_MODULE := CameraCalibration
LOCAL_MODULE_OWNER := ohrtech
LOCAL_SRC_FILES := modules/system_ext/app/CameraCalibration/CameraCalibration.apk
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_SUFFIX := .apk
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := CameraCalibration
LOCAL_MODULE_OWNER := ohrtech
LOCAL_SRC_FILES := modules/system_ext/app/CameraCalibration/oat/arm64/CameraCalibration.odex
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_SUFFIX := .odex
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := CameraCalibration
LOCAL_MODULE_OWNER := ohrtech
LOCAL_SRC_FILES := modules/system_ext/app/CameraCalibration/oat/arm64/CameraCalibration.vdex
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_SUFFIX := .vdex
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)