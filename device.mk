#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#


$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_release.mk)

DEVICE_PATH := device/ohrtech/aleph
TARGET_PREBUILT_KERNEL :=$(DEVICE_PATH)/prebuilts/kernel
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel


# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_hw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_hw.xml \
    $(LOCAL_PATH)/configs/audio/audio_para:$(TARGET_COPY_OUT_VENDOR)/etc/audio_para \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_smart_pa.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_smart_pa.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/primary_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/primary_audio_policy_configuration_smart_pa.xml:$(TARGET_COPY_OUT_VENDOR)/etc/primary_audio_policy_configuration_smart_pa.xml \
    $(LOCAL_PATH)/configs/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_turnkey.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_turnkey.xml \

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.cts.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.cts.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \

# from GSI
PRODUCT_PACKAGES += \
vndk_apex_snapshot_package

PRODUCT_COPY_FILES += \
device/sample/etc/apns-full-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml



#PRODUCT_COPY_FILES += \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/manifests/vendor/manifest/,$(TARGET_COPY_OUT_VENDOR)/etc/vintf/manifest) 


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


PRODUCT_PACKAGES += \
strip_packages