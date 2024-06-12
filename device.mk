#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#


$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)


DEVICE_PATH := device/ohrtech/aleph


PRODUCT_PACKAGES += \
    vndservicemanager \
    cpio \
    cplogctl

#vendor
PRODUCT_PACKAGES += \
libhwc2on1adapter \
libtinycompress \
librilutils \
#androidx.camera.extensions.impl

#vendor/lib

#PRODUCT_COPY_FILES += \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/modules/vendor/lib/,$(TARGET_COPY_OUT_VENDOR)/lib) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/modules/vendor/lib64/,$(TARGET_COPY_OUT_VENDOR)/lib64) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/packages/vendor/app/LogManager/oat,$(TARGET_COPY_OUT_VENDOR)/app/LogManager/oat) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/packages/vendor/app/UASetting/oat,$(TARGET_COPY_OUT_VENDOR)/app/UASetting/oat)

#system_ext
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
EmergencyInfo


#PRODUCT_COPY_FILES += \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/modules/system_ext/bin/,$(TARGET_COPY_OUT_SYSTEM_EXT)/bin) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/modules/system_ext/lib/,$(TARGET_COPY_OUT_SYSTEM_EXT)/lib) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/modules/system_ext/lib64/,$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64)


#system
PRODUCT_PACKAGES += \
LiveWallpapersPicker \
libyuv

#PRODUCT_COPY_FILES += \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/modules/system/lib/,$(TARGET_COPY_OUT_SYSTEM)/lib) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/modules/system/lib64/,$(TARGET_COPY_OUT_SYSTEM)/lib64) \

#PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

#AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    otapreopt_script
    #checkpoint_gc
    
# API levels
PRODUCT_SHIPPING_API_LEVEL := 33

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
#PRODUCT_PACKAGES += \
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
    zramwb.sh

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
   

    
VENDOR_MODULES_PATH = $(DEVICE_PATH)/modules/vendor_dlkm/lib/modules

PRODUCT_COPY_FILES += \
    $(VENDOR_MODULES_PATH)/init.insmod.cfg:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/init.insmod.cfg
    
BOARD_VENDOR_KERNEL_MODULES := \
$(VENDOR_MODULES_PATH)/aes-ce-ccm.ko \
$(VENDOR_MODULES_PATH)/aes-neon-blk.ko \
$(VENDOR_MODULES_PATH)/agdsp_access.ko \
$(VENDOR_MODULES_PATH)/apsys-dvfs.ko \
$(VENDOR_MODULES_PATH)/arc4.ko \
$(VENDOR_MODULES_PATH)/asix.ko \
$(VENDOR_MODULES_PATH)/audio-dsp-dump.ko \
$(VENDOR_MODULES_PATH)/audio-pipe.ko \
$(VENDOR_MODULES_PATH)/audio_mem.ko \
$(VENDOR_MODULES_PATH)/audio_sipc.ko \
$(VENDOR_MODULES_PATH)/ax88179_178a.ko \
$(VENDOR_MODULES_PATH)/bq2560x-charger.ko \
$(VENDOR_MODULES_PATH)/bq2597x-charger.ko \
$(VENDOR_MODULES_PATH)/core.ko \
$(VENDOR_MODULES_PATH)/cpufreq_userspace.ko \
$(VENDOR_MODULES_PATH)/extcon-usb-gpio.ko \
$(VENDOR_MODULES_PATH)/flash_ic_aw3641.ko \
$(VENDOR_MODULES_PATH)/flash_ic_ocp8137.ko \
$(VENDOR_MODULES_PATH)/flash_ic_sc2730_rgb.ko \
$(VENDOR_MODULES_PATH)/focaltech_ft8756_spi_ts.ko \
$(VENDOR_MODULES_PATH)/ghash-ce.ko \
$(VENDOR_MODULES_PATH)/gnss_common_ctl_all.ko \
$(VENDOR_MODULES_PATH)/gnss_dbg.ko \
$(VENDOR_MODULES_PATH)/gnss_pmnotify_ctl.ko \
$(VENDOR_MODULES_PATH)/gpio.ko \
$(VENDOR_MODULES_PATH)/gslX680_sharkl3.ko \
$(VENDOR_MODULES_PATH)/hall_mh248.ko \
$(VENDOR_MODULES_PATH)/hl1506_charger.ko \
$(VENDOR_MODULES_PATH)/ims_bridge.ko \
$(VENDOR_MODULES_PATH)/ion_cma_heap.ko \
$(VENDOR_MODULES_PATH)/ion_ipc_trusty.ko \
$(VENDOR_MODULES_PATH)/jpg.ko \
$(VENDOR_MODULES_PATH)/leds-sc27xx-bltc.ko \
$(VENDOR_MODULES_PATH)/ledtrig-pattern.ko \
$(VENDOR_MODULES_PATH)/mali_kbase.ko \
$(VENDOR_MODULES_PATH)/mcdt_hw_r2p0.ko \
$(VENDOR_MODULES_PATH)/microarray_fp.ko \
$(VENDOR_MODULES_PATH)/mipi_driver.ko \
$(VENDOR_MODULES_PATH)/misc_sprd_uid.ko \
$(VENDOR_MODULES_PATH)/mmdvfs.ko \
$(VENDOR_MODULES_PATH)/musb_hdrc.ko \
$(VENDOR_MODULES_PATH)/musb_sprd.ko \
$(VENDOR_MODULES_PATH)/nu1619_wireless_charger.ko \
$(VENDOR_MODULES_PATH)/nvt_nt36xxx_spi_ts.ko \
$(VENDOR_MODULES_PATH)/phy-sprd-commonphy.ko \
$(VENDOR_MODULES_PATH)/phy-sprd-qogirl6.ko \
$(VENDOR_MODULES_PATH)/pinctrl-sprd-qogirl6.ko \
$(VENDOR_MODULES_PATH)/pinctrl-sprd.ko \
$(VENDOR_MODULES_PATH)/pinctrl.ko \
$(VENDOR_MODULES_PATH)/pwm-sprd.ko \
$(VENDOR_MODULES_PATH)/sc27xx-poweroff.ko \
$(VENDOR_MODULES_PATH)/sc27xx-vibra.ko \
$(VENDOR_MODULES_PATH)/sc27xx_adc.ko \
$(VENDOR_MODULES_PATH)/sc27xx_fast_charger.ko \
$(VENDOR_MODULES_PATH)/sc27xx_fuel_gauge.ko \
$(VENDOR_MODULES_PATH)/sc27xx_pd.ko \
$(VENDOR_MODULES_PATH)/sc27xx_tsensor_thermal.ko \
$(VENDOR_MODULES_PATH)/sc27xx_typec.ko \
$(VENDOR_MODULES_PATH)/sc8549-charger.ko \
$(VENDOR_MODULES_PATH)/sgm41511-charger.ko \
$(VENDOR_MODULES_PATH)/sha1-ce.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-card.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-codec-sc2730-power-dev.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-codec-sc2730-power.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-codec-sc2730.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-codec-ump518-power-dev.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-codec-ump518-power.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-codec-ump518.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-dummy-codec.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-pdm-r2p0.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-vbc-fe.ko \
$(VENDOR_MODULES_PATH)/snd-soc-sprd-vbc-v4.ko \
$(VENDOR_MODULES_PATH)/spi-sprd.ko \
$(VENDOR_MODULES_PATH)/sprd-bc1p2.ko \
$(VENDOR_MODULES_PATH)/sprd-charger-manager.ko \
$(VENDOR_MODULES_PATH)/sprd-compr-2stage-dma.ko \
$(VENDOR_MODULES_PATH)/sprd-dma.ko \
$(VENDOR_MODULES_PATH)/sprd-dmaengine-pcm.ko \
$(VENDOR_MODULES_PATH)/sprd-drm.ko \
$(VENDOR_MODULES_PATH)/sprd-gsp.ko \
$(VENDOR_MODULES_PATH)/sprd-ion.ko \
$(VENDOR_MODULES_PATH)/sprd-platform-pcm-routing.ko \
$(VENDOR_MODULES_PATH)/sprd-top-dvfs.ko \
$(VENDOR_MODULES_PATH)/sprd-vsp-pw-domain.ko \
$(VENDOR_MODULES_PATH)/sprdbt_tty.ko \
$(VENDOR_MODULES_PATH)/sprd_apipe.ko \
$(VENDOR_MODULES_PATH)/sprd_audcp_boot.ko \
$(VENDOR_MODULES_PATH)/sprd_audcp_dvfs.ko \
$(VENDOR_MODULES_PATH)/sprd_battery_info.ko \
$(VENDOR_MODULES_PATH)/sprd_camera.ko \
$(VENDOR_MODULES_PATH)/sprd_camsys_pw_domain.ko \
$(VENDOR_MODULES_PATH)/sprd_cpp.ko \
$(VENDOR_MODULES_PATH)/sprd_cpu_cooling.ko \
$(VENDOR_MODULES_PATH)/sprd_cp_dvfs.ko \
$(VENDOR_MODULES_PATH)/sprd_ddr_dvfs.ko \
$(VENDOR_MODULES_PATH)/sprd_flash_drv.ko \
$(VENDOR_MODULES_PATH)/sprd_fm.ko \
$(VENDOR_MODULES_PATH)/sprd_fuel_gauge.ko \
$(VENDOR_MODULES_PATH)/sprd_gpu_cooling.ko \
$(VENDOR_MODULES_PATH)/sprd_map.ko \
$(VENDOR_MODULES_PATH)/sprd_mipi.ko \
$(VENDOR_MODULES_PATH)/sprd_pmic_syscon.ko \
$(VENDOR_MODULES_PATH)/sprd_pmic_wdt.ko \
$(VENDOR_MODULES_PATH)/sprd_sensor.ko \
$(VENDOR_MODULES_PATH)/sprd_soc_id.ko \
$(VENDOR_MODULES_PATH)/sprd_soc_thm.ko \
$(VENDOR_MODULES_PATH)/sprd_suspend_helper.ko \
$(VENDOR_MODULES_PATH)/sprd_tcpm.ko \
$(VENDOR_MODULES_PATH)/sprd_thermal.ko \
$(VENDOR_MODULES_PATH)/sprd_usbpinmux_qogirl6.ko \
$(VENDOR_MODULES_PATH)/sprd_usb_f_rndis.ko \
$(VENDOR_MODULES_PATH)/sprd_u_ether.ko \
$(VENDOR_MODULES_PATH)/sprd_wdf.ko \
$(VENDOR_MODULES_PATH)/sprd_wlan_combo.ko \
$(VENDOR_MODULES_PATH)/thermal-generic-adc.ko \
$(VENDOR_MODULES_PATH)/trusty-tui.ko \
$(VENDOR_MODULES_PATH)/twofish_common.ko \
$(VENDOR_MODULES_PATH)/twofish_generic.ko \
$(VENDOR_MODULES_PATH)/unisoc-iommu.ko \
$(VENDOR_MODULES_PATH)/upm6710-charger.ko \
$(VENDOR_MODULES_PATH)/virt-dma.ko \
$(VENDOR_MODULES_PATH)/vsp.ko \
$(VENDOR_MODULES_PATH)/wcn_bsp.ko \
$(VENDOR_MODULES_PATH)/zram.ko \
$(VENDOR_MODULES_PATH)/zsmalloc.ko


BOARD_VENDOR_CHARGER_KERNEL_MODULES := \
$(VENDOR_MODULES_PATH)/sprd_systimer.ko \
$(VENDOR_MODULES_PATH)/sprd-sc27xx-spi.ko \
$(VENDOR_MODULES_PATH)/rtc-sc27xx.ko \
$(VENDOR_MODULES_PATH)/gslX680_sharkl3.ko \
$(VENDOR_MODULES_PATH)/sprd_soc_id.ko \
$(VENDOR_MODULES_PATH)/trusty-tui.ko \
$(VENDOR_MODULES_PATH)/flash_ic_sc2730_rgb.ko \
$(VENDOR_MODULES_PATH)/flash_ic_aw3641.ko \
$(VENDOR_MODULES_PATH)/sprd-dma.ko \
$(VENDOR_MODULES_PATH)/virt-dma.ko \
$(VENDOR_MODULES_PATH)/ion_ipc_trusty.ko \
$(VENDOR_MODULES_PATH)/ion_cma_heap.ko \
$(VENDOR_MODULES_PATH)/sprd-ion.ko \
$(VENDOR_MODULES_PATH)/unisoc-iommu.ko \
$(VENDOR_MODULES_PATH)/sprd-drm.ko \
$(VENDOR_MODULES_PATH)/sprd-gsp.ko \
$(VENDOR_MODULES_PATH)/apsys-dvfs.ko \
$(VENDOR_MODULES_PATH)/sprd_cpu_cooling.ko \
$(VENDOR_MODULES_PATH)/sprd_gpu_cooling.ko \
$(VENDOR_MODULES_PATH)/sprd_soc_thm.ko \
$(VENDOR_MODULES_PATH)/extcon-usb-gpio.ko \
$(VENDOR_MODULES_PATH)/leds-sc27xx-bltc.ko \
$(VENDOR_MODULES_PATH)/ledtrig-pattern.ko \
$(VENDOR_MODULES_PATH)/pinctrl-sprd.ko \
$(VENDOR_MODULES_PATH)/pinctrl-sprd-qogirl6.ko \
$(VENDOR_MODULES_PATH)/pwm-sprd.ko \
$(VENDOR_MODULES_PATH)/sc27xx_adc.ko \
$(VENDOR_MODULES_PATH)/sc27xx-poweroff.ko \
$(VENDOR_MODULES_PATH)/sprd_pmic_syscon.ko \
$(VENDOR_MODULES_PATH)/sc27xx_tsensor_thermal.ko \
$(VENDOR_MODULES_PATH)/sprd_thermal.ko \
$(VENDOR_MODULES_PATH)/thermal-generic-adc.ko \
$(VENDOR_MODULES_PATH)/sc27xx-vibra.ko \
$(VENDOR_MODULES_PATH)/sprd_usbpinmux_qogirl6.ko \
$(VENDOR_MODULES_PATH)/sprd-bc1p2.ko \
$(VENDOR_MODULES_PATH)/phy-sprd-commonphy.ko \
$(VENDOR_MODULES_PATH)/phy-sprd-qogirl6.ko \
$(VENDOR_MODULES_PATH)/sprd_tcpm.ko \
$(VENDOR_MODULES_PATH)/sc27xx_typec.ko \
$(VENDOR_MODULES_PATH)/sc27xx_pd.ko \
$(VENDOR_MODULES_PATH)/sc27xx_fast_charger.ko \
$(VENDOR_MODULES_PATH)/sprd_battery_info.ko \
$(VENDOR_MODULES_PATH)/sprd_fuel_gauge.ko \
$(VENDOR_MODULES_PATH)/sc27xx_fuel_gauge.ko \
$(VENDOR_MODULES_PATH)/bq2560x-charger.ko \
$(VENDOR_MODULES_PATH)/sgm41511-charger.ko \
$(VENDOR_MODULES_PATH)/bq2597x-charger.ko \
$(VENDOR_MODULES_PATH)/sc8549-charger.ko \
$(VENDOR_MODULES_PATH)/upm6710-charger.ko \
$(VENDOR_MODULES_PATH)/hl1506_charger.ko \
$(VENDOR_MODULES_PATH)/nu1619_wireless_charger.ko \
$(VENDOR_MODULES_PATH)/sprd-charger-manager.ko \
$(VENDOR_MODULES_PATH)/sprd_map.ko \
$(VENDOR_MODULES_PATH)/focaltech_ft8756_spi_ts.ko \
$(VENDOR_MODULES_PATH)/nvt_nt36xxx_spi_ts.ko \
$(VENDOR_MODULES_PATH)/musb_hdrc.ko \
$(VENDOR_MODULES_PATH)/musb_sprd.ko


VENDOR_BOOT_MODULES_PATH = $(DEVICE_PATH)/modules/vendor_boot/lib/modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := \
$(VENDOR_BOOT_MODULES_PATH)/sprd_wdt_fiq.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_sip_svc.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_systimer.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_time_sync.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_time_sync_cp.ko \
$(VENDOR_BOOT_MODULES_PATH)/clk-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/ums9230-clk.ko \
$(VENDOR_BOOT_MODULES_PATH)/spi-sprd-adi.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-sc27xx-spi.ko \
$(VENDOR_BOOT_MODULES_PATH)/rtc-sc27xx.ko \
$(VENDOR_BOOT_MODULES_PATH)/sc2730-regulator.ko \
$(VENDOR_BOOT_MODULES_PATH)/ump518-regulator.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_soc_id.ko \
$(VENDOR_BOOT_MODULES_PATH)/rpmb.ko \
$(VENDOR_BOOT_MODULES_PATH)/ufs-sprd_qogirl6.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_hwspinlock.ko \
$(VENDOR_BOOT_MODULES_PATH)/nvmem-sc27xx-efuse.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_lookat.ko \
$(VENDOR_BOOT_MODULES_PATH)/nvmem_sprd_cache_efuse.ko \
$(VENDOR_BOOT_MODULES_PATH)/nvmem_sprd_efuse.ko \
$(VENDOR_BOOT_MODULES_PATH)/i2c-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/i2c-sprd-hw-v2.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-cpufreq-v2.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-cpufreq-public.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_7sreset.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_manufacturer_model.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-pm.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-log.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-irq.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-ipc.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-virtio.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_shm.ko \
$(VENDOR_BOOT_MODULES_PATH)/gpio-eic-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/gpio-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/gpio-pmic-eic-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/sdhci-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/mmc_hsq.ko \
$(VENDOR_BOOT_MODULES_PATH)/mmc_swcq.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_pmic_syscon.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_pdbg.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_power_stat.ko \
$(VENDOR_BOOT_MODULES_PATH)/kfifo_buf.ko \
$(VENDOR_BOOT_MODULES_PATH)/sensorhub.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_power_manager.ko \
$(VENDOR_BOOT_MODULES_PATH)/unisoc-mailbox.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-sipc-virt-bus.ko \
$(VENDOR_BOOT_MODULES_PATH)/sipc-core.ko \
$(VENDOR_BOOT_MODULES_PATH)/spipe.ko \
$(VENDOR_BOOT_MODULES_PATH)/spool.ko \
$(VENDOR_BOOT_MODULES_PATH)/sipx.ko \
$(VENDOR_BOOT_MODULES_PATH)/seth.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_modem_loader.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_iq.ko \
$(VENDOR_BOOT_MODULES_PATH)/slog_bridge.ko \
$(VENDOR_BOOT_MODULES_PATH)/sbuf_bridge.ko \
$(VENDOR_BOOT_MODULES_PATH)/sblock_bridge.ko \
$(VENDOR_BOOT_MODULES_PATH)/usb_f_vser.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_apb_busmonitor.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_busmonitor.ko \
$(VENDOR_BOOT_MODULES_PATH)/djtag_core.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_djtag.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_pmic_smpl.ko

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES  := \
$(VENDOR_BOOT_MODULES_PATH)/sprd_wdt_fiq.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_sip_svc.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_systimer.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_time_sync.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_time_sync_cp.ko \
$(VENDOR_BOOT_MODULES_PATH)/clk-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/ums9230-clk.ko \
$(VENDOR_BOOT_MODULES_PATH)/spi-sprd-adi.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-sc27xx-spi.ko \
$(VENDOR_BOOT_MODULES_PATH)/rtc-sc27xx.ko \
$(VENDOR_BOOT_MODULES_PATH)/sc2730-regulator.ko \
$(VENDOR_BOOT_MODULES_PATH)/ump518-regulator.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_soc_id.ko \
$(VENDOR_BOOT_MODULES_PATH)/rpmb.ko \
$(VENDOR_BOOT_MODULES_PATH)/ufs-sprd_qogirl6.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_hwspinlock.ko \
$(VENDOR_BOOT_MODULES_PATH)/nvmem-sc27xx-efuse.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_lookat.ko \
$(VENDOR_BOOT_MODULES_PATH)/nvmem_sprd_cache_efuse.ko \
$(VENDOR_BOOT_MODULES_PATH)/nvmem_sprd_efuse.ko \
$(VENDOR_BOOT_MODULES_PATH)/i2c-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/i2c-sprd-hw-v2.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-cpufreq-v2.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-cpufreq-public.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_7sreset.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_manufacturer_model.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-pm.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-log.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-irq.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-ipc.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-virtio.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_shm.ko \
$(VENDOR_BOOT_MODULES_PATH)/gpio-eic-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/gpio-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/gpio-pmic-eic-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/sdhci-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/mmc_hsq.ko \
$(VENDOR_BOOT_MODULES_PATH)/mmc_swcq.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_pmic_syscon.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_pdbg.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_power_stat.ko \
$(VENDOR_BOOT_MODULES_PATH)/kfifo_buf.ko \
$(VENDOR_BOOT_MODULES_PATH)/sensorhub.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_power_manager.ko \
$(VENDOR_BOOT_MODULES_PATH)/unisoc-mailbox.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-sipc-virt-bus.ko \
$(VENDOR_BOOT_MODULES_PATH)/sipc-core.ko \
$(VENDOR_BOOT_MODULES_PATH)/spipe.ko \
$(VENDOR_BOOT_MODULES_PATH)/spool.ko \
$(VENDOR_BOOT_MODULES_PATH)/sipx.ko \
$(VENDOR_BOOT_MODULES_PATH)/seth.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_modem_loader.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_iq.ko \
$(VENDOR_BOOT_MODULES_PATH)/slog_bridge.ko \
$(VENDOR_BOOT_MODULES_PATH)/sbuf_bridge.ko \
$(VENDOR_BOOT_MODULES_PATH)/sblock_bridge.ko \
$(VENDOR_BOOT_MODULES_PATH)/usb_f_vser.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_apb_busmonitor.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_busmonitor.ko \
$(VENDOR_BOOT_MODULES_PATH)/djtag_core.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_djtag.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_pmic_smpl.ko \
$(VENDOR_BOOT_MODULES_PATH)/gslX680_sharkl3.ko \
$(VENDOR_BOOT_MODULES_PATH)/trusty-tui.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_flash_drv.ko \
$(VENDOR_BOOT_MODULES_PATH)/flash_ic_sc2730_rgb.ko \
$(VENDOR_BOOT_MODULES_PATH)/flash_ic_ocp8137.ko \
$(VENDOR_BOOT_MODULES_PATH)/flash_ic_aw3641.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_camsys_pw_domain.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-dma.ko \
$(VENDOR_BOOT_MODULES_PATH)/virt-dma.ko \
$(VENDOR_BOOT_MODULES_PATH)/ion_ipc_trusty.ko \
$(VENDOR_BOOT_MODULES_PATH)/ion_cma_heap.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-ion.ko \
$(VENDOR_BOOT_MODULES_PATH)/unisoc-iommu.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_sensor.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_camera.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-vsp-pw-domain.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_cpp.ko \
$(VENDOR_BOOT_MODULES_PATH)/sha1-ce.ko \
$(VENDOR_BOOT_MODULES_PATH)/ghash-ce.ko \
$(VENDOR_BOOT_MODULES_PATH)/aes-ce-ccm.ko \
$(VENDOR_BOOT_MODULES_PATH)/aes-neon-blk.ko \
$(VENDOR_BOOT_MODULES_PATH)/arc4.ko \
$(VENDOR_BOOT_MODULES_PATH)/twofish_generic.ko \
$(VENDOR_BOOT_MODULES_PATH)/twofish_common.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-drm.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-gsp.ko \
$(VENDOR_BOOT_MODULES_PATH)/apsys-dvfs.ko \
$(VENDOR_BOOT_MODULES_PATH)/extcon-usb-gpio.ko \
$(VENDOR_BOOT_MODULES_PATH)/microarray_fp.ko \
$(VENDOR_BOOT_MODULES_PATH)/core.ko \
$(VENDOR_BOOT_MODULES_PATH)/gpio.ko \
$(VENDOR_BOOT_MODULES_PATH)/pinctrl.ko \
$(VENDOR_BOOT_MODULES_PATH)/vsp.ko \
$(VENDOR_BOOT_MODULES_PATH)/jpg.ko \
$(VENDOR_BOOT_MODULES_PATH)/leds-sc27xx-bltc.ko \
$(VENDOR_BOOT_MODULES_PATH)/ledtrig-pattern.ko \
$(VENDOR_BOOT_MODULES_PATH)/zram.ko \
$(VENDOR_BOOT_MODULES_PATH)/zsmalloc.ko \
$(VENDOR_BOOT_MODULES_PATH)/pinctrl-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/pinctrl-sprd-qogirl6.ko \
$(VENDOR_BOOT_MODULES_PATH)/spi-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/pwm-sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/sc27xx_adc.ko \
$(VENDOR_BOOT_MODULES_PATH)/sc27xx-poweroff.ko \
$(VENDOR_BOOT_MODULES_PATH)/sc27xx-vibra.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_usbpinmux_qogirl6.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-bc1p2.ko \
$(VENDOR_BOOT_MODULES_PATH)/phy-sprd-commonphy.ko \
$(VENDOR_BOOT_MODULES_PATH)/phy-sprd-qogirl6.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_tcpm.ko \
$(VENDOR_BOOT_MODULES_PATH)/sc27xx_typec.ko \
$(VENDOR_BOOT_MODULES_PATH)/sc27xx_pd.ko \
$(VENDOR_BOOT_MODULES_PATH)/sc27xx_fast_charger.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_battery_info.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_fuel_gauge.ko \
$(VENDOR_BOOT_MODULES_PATH)/sc27xx_fuel_gauge.ko \
$(VENDOR_BOOT_MODULES_PATH)/bq2560x-charger.ko \
$(VENDOR_BOOT_MODULES_PATH)/sgm41511-charger.ko \
$(VENDOR_BOOT_MODULES_PATH)/bq2597x-charger.ko \
$(VENDOR_BOOT_MODULES_PATH)/sc8549-charger.ko \
$(VENDOR_BOOT_MODULES_PATH)/upm6710-charger.ko \
$(VENDOR_BOOT_MODULES_PATH)/hl1506_charger.ko \
$(VENDOR_BOOT_MODULES_PATH)/nu1619_wireless_charger.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-charger-manager.ko \
$(VENDOR_BOOT_MODULES_PATH)/misc_sprd_uid.ko \
$(VENDOR_BOOT_MODULES_PATH)/focaltech_ft8756_spi_ts.ko \
$(VENDOR_BOOT_MODULES_PATH)/nvt_nt36xxx_spi_ts.ko \
$(VENDOR_BOOT_MODULES_PATH)/musb_hdrc.ko \
$(VENDOR_BOOT_MODULES_PATH)/musb_sprd.ko \
$(VENDOR_BOOT_MODULES_PATH)/agdsp_access.ko \
$(VENDOR_BOOT_MODULES_PATH)/audio-dsp-dump.ko \
$(VENDOR_BOOT_MODULES_PATH)/audio_mem.ko \
$(VENDOR_BOOT_MODULES_PATH)/asix.ko \
$(VENDOR_BOOT_MODULES_PATH)/ax88179_178a.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_apipe.ko \
$(VENDOR_BOOT_MODULES_PATH)/audio_sipc.ko \
$(VENDOR_BOOT_MODULES_PATH)/audio-pipe.ko \
$(VENDOR_BOOT_MODULES_PATH)/mcdt_hw_r2p0.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_audcp_dvfs.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd_audcp_boot.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-codec-sc2730.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-codec-sc2730-power.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-codec-sc2730-power-dev.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-codec-ump518.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-codec-ump518-power.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-codec-ump518-power-dev.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-dummy-codec.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-pdm-r2p0.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-platform-pcm-routing.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-vbc-v4.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-vbc-fe.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-dmaengine-pcm.ko \
$(VENDOR_BOOT_MODULES_PATH)/sprd-compr-2stage-dma.ko \
$(VENDOR_BOOT_MODULES_PATH)/snd-soc-sprd-card.ko


# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
#$(call inherit-product, vendor/ohrtech/aleph/aleph-vendor.mk)