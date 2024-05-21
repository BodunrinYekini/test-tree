#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

DEVICE_PATH := device/ohrtech/aleph
TARGET_PREBUILT_KERNEL :=$(DEVICE_PATH)/prebuilts/kernel
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

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
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

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
    framework-res__auto_generated_rro_product \
    framework-res_navbar_rro \
    FrameworkResOverlay \
    GoogleCaptivePortalLoginGoOverlay \
    GoogleDocumentsUIOverlay \
    GoogleExtServicesConfigOverlay \
    GooglePermissionControllerFrameworkOverlay \
    GooglePermissionControllerOverlay \
    ModuleMetadataGoogleOverlay \
    Settings__auto_generated_rro_product \
    SettingsProvider__auto_generated_rro_product \
    SysuiGoConfigOverlay \
    TeleService__auto_generated_rro_product \
    TeleServiceOverlay \
    unisoc-res__auto_generated_rro_product \
    WallpaperOverlay \
    com.google.mainline.go.telemetry \
    apns-conf.xml

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
    $(LOCAL_PATH)/rootdir/etc/fstab.ums9230_1h10:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.ums9230_1h10

VENDOR_DLKM_MODULES_PATH = $(DEVICE_PATH)/modules/vendor_dlkm/lib/modules
BOARD_VENDOR_KERNEL_MODULES += \
$(VENDOR_DLKM_MODULES_PATH)/gslX680_sharkl3.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-top-dvfs.ko \
$(VENDOR_DLKM_MODULES_PATH)/trusty-tui.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_flash_drv.ko \
$(VENDOR_DLKM_MODULES_PATH)/flash_ic_sc2730_rgb.ko \
$(VENDOR_DLKM_MODULES_PATH)/flash_ic_ocp8137.ko \
$(VENDOR_DLKM_MODULES_PATH)/flash_ic_aw3641.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_camsys_pw_domain.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-dma.ko \
$(VENDOR_DLKM_MODULES_PATH)/virt-dma.ko \
$(VENDOR_DLKM_MODULES_PATH)/ion_ipc_trusty.ko \
$(VENDOR_DLKM_MODULES_PATH)/ion_cma_heap.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-ion.ko \
$(VENDOR_DLKM_MODULES_PATH)/unisoc-iommu.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_sensor.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_camera.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-vsp-pw-domain.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_cpp.ko \
$(VENDOR_DLKM_MODULES_PATH)/mmdvfs.ko \
$(VENDOR_DLKM_MODULES_PATH)/sha1-ce.ko \
$(VENDOR_DLKM_MODULES_PATH)/ghash-ce.ko \
$(VENDOR_DLKM_MODULES_PATH)/aes-ce-ccm.ko \
$(VENDOR_DLKM_MODULES_PATH)/aes-neon-blk.ko \
$(VENDOR_DLKM_MODULES_PATH)/arc4.ko \
$(VENDOR_DLKM_MODULES_PATH)/twofish_generic.ko \
$(VENDOR_DLKM_MODULES_PATH)/twofish_common.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-drm.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-gsp.ko \
$(VENDOR_DLKM_MODULES_PATH)/apsys-dvfs.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_cpu_cooling.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_gpu_cooling.ko \
$(VENDOR_DLKM_MODULES_PATH)/mali_kbase.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_soc_thm.ko \
$(VENDOR_DLKM_MODULES_PATH)/extcon-usb-gpio.ko \
$(VENDOR_DLKM_MODULES_PATH)/microarray_fp.ko \
$(VENDOR_DLKM_MODULES_PATH)/core.ko \
$(VENDOR_DLKM_MODULES_PATH)/gpio.ko \
$(VENDOR_DLKM_MODULES_PATH)/pinctrl.ko \
$(VENDOR_DLKM_MODULES_PATH)/vsp.ko \
$(VENDOR_DLKM_MODULES_PATH)/jpg.ko \
$(VENDOR_DLKM_MODULES_PATH)/leds-sc27xx-bltc.ko \
$(VENDOR_DLKM_MODULES_PATH)/ledtrig-pattern.ko \
$(VENDOR_DLKM_MODULES_PATH)/zram.ko \
$(VENDOR_DLKM_MODULES_PATH)/zsmalloc.ko \
$(VENDOR_DLKM_MODULES_PATH)/pinctrl-sprd.ko \
$(VENDOR_DLKM_MODULES_PATH)/pinctrl-sprd-qogirl6.ko \
$(VENDOR_DLKM_MODULES_PATH)/spi-sprd.ko \
$(VENDOR_DLKM_MODULES_PATH)/pwm-sprd.ko \
$(VENDOR_DLKM_MODULES_PATH)/sc27xx_adc.ko \
$(VENDOR_DLKM_MODULES_PATH)/sc27xx-poweroff.ko \
$(VENDOR_DLKM_MODULES_PATH)/sc27xx_tsensor_thermal.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_thermal.ko \
$(VENDOR_DLKM_MODULES_PATH)/thermal-generic-adc.ko \
$(VENDOR_DLKM_MODULES_PATH)/sc27xx-vibra.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_usbpinmux_qogirl6.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-bc1p2.ko \
$(VENDOR_DLKM_MODULES_PATH)/phy-sprd-commonphy.ko \
$(VENDOR_DLKM_MODULES_PATH)/phy-sprd-qogirl6.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_tcpm.ko \
$(VENDOR_DLKM_MODULES_PATH)/sc27xx_typec.ko \
$(VENDOR_DLKM_MODULES_PATH)/sc27xx_pd.ko \
$(VENDOR_DLKM_MODULES_PATH)/sc27xx_fast_charger.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_battery_info.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_fuel_gauge.ko \
$(VENDOR_DLKM_MODULES_PATH)/sc27xx_fuel_gauge.ko \
$(VENDOR_DLKM_MODULES_PATH)/bq2560x-charger.ko \
$(VENDOR_DLKM_MODULES_PATH)/sgm41511-charger.ko \
$(VENDOR_DLKM_MODULES_PATH)/bq2597x-charger.ko \
$(VENDOR_DLKM_MODULES_PATH)/sc8549-charger.ko \
$(VENDOR_DLKM_MODULES_PATH)/upm6710-charger.ko \
$(VENDOR_DLKM_MODULES_PATH)/hl1506_charger.ko \
$(VENDOR_DLKM_MODULES_PATH)/nu1619_wireless_charger.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-charger-manager.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_cp_dvfs.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_ddr_dvfs.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_map.ko \
$(VENDOR_DLKM_MODULES_PATH)/ims_bridge.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_pmic_wdt.ko \
$(VENDOR_DLKM_MODULES_PATH)/misc_sprd_uid.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_u_ether.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_usb_f_rndis.ko \
$(VENDOR_DLKM_MODULES_PATH)/wcn_bsp.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_wlan_combo.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprdbt_tty.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_fm.ko \
$(VENDOR_DLKM_MODULES_PATH)/gnss_common_ctl_all.ko \
$(VENDOR_DLKM_MODULES_PATH)/gnss_dbg.ko \
$(VENDOR_DLKM_MODULES_PATH)/gnss_pmnotify_ctl.ko \
$(VENDOR_DLKM_MODULES_PATH)/focaltech_ft8756_spi_ts.ko \
$(VENDOR_DLKM_MODULES_PATH)/nvt_nt36xxx_spi_ts.ko \
$(VENDOR_DLKM_MODULES_PATH)/musb_hdrc.ko \
$(VENDOR_DLKM_MODULES_PATH)/musb_sprd.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_wdf.ko \
$(VENDOR_DLKM_MODULES_PATH)/agdsp_access.ko \
$(VENDOR_DLKM_MODULES_PATH)/audio-dsp-dump.ko \
$(VENDOR_DLKM_MODULES_PATH)/audio_mem.ko \
$(VENDOR_DLKM_MODULES_PATH)/asix.ko \
$(VENDOR_DLKM_MODULES_PATH)/ax88179_178a.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_apipe.ko \
$(VENDOR_DLKM_MODULES_PATH)/audio_sipc.ko \
$(VENDOR_DLKM_MODULES_PATH)/audio-pipe.ko \
$(VENDOR_DLKM_MODULES_PATH)/mcdt_hw_r2p0.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_audcp_dvfs.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_audcp_boot.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-codec-sc2730.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-codec-sc2730-power.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-codec-sc2730-power-dev.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-codec-ump518.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-codec-ump518-power.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-codec-ump518-power-dev.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-dummy-codec.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-pdm-r2p0.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-platform-pcm-routing.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-vbc-v4.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-vbc-fe.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-dmaengine-pcm.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd-compr-2stage-dma.ko \
$(VENDOR_DLKM_MODULES_PATH)/snd-soc-sprd-card.ko \
$(VENDOR_DLKM_MODULES_PATH)/cpufreq_userspace.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_mipi.ko \
$(VENDOR_DLKM_MODULES_PATH)/mipi_driver.ko \
$(VENDOR_DLKM_MODULES_PATH)/sprd_suspend_helper.ko



# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/ohrtech/aleph/aleph-vendor.mk)
