#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Use generic ramdisk
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# API levels
PRODUCT_SHIPPING_API_LEVEL := 34

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# First stage console
PRODUCT_PACKAGES += \
    linker.vendor_ramdisk \
    shell_and_utilities_vendor_ramdisk \
    #adbd_vendor_ramdisk \
    
PRODUCT_PACKAGES += \
    resize2fs.vendor_ramdisk \
    tune2fs.vendor_ramdisk

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS := # leave it empty

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := phone

# Ramdisk firmware
PRODUCT_COPY_FILES += \
    device/samsung/e1s/firmware/vangogh_lite_unified_evt0.bin:$(TARGET_COPY_OUT_RECOVERY)/root/lib/firmware/sgpu/vangogh_lite_unified_evt0.bin \
    device/samsung/e1s/firmware/vangogh_lite_unified_evt0.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/firmware/sgpu/vangogh_lite_unified_evt0.bin \
    device/samsung/e1s/firmware/vangogh_lite_unified_evt1.bin:$(TARGET_COPY_OUT_RECOVERY)/root/lib/firmware/sgpu/vangogh_lite_unified_evt1.bin \
    device/samsung/e1s/firmware/vangogh_lite_unified_evt1.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/firmware/sgpu/vangogh_lite_unified_evt1.bin \

PRODUCT_COPY_FILES += \
    vendor/samsung/e1s/proprietary/vendor/firmware/00_generic_xtalk_shape.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/00_generic_xtalk_shape.bin \
    vendor/samsung/e1s/proprietary/vendor/firmware/00_generic_xtalk_shape.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/00_generic_xtalk_shape.bin \
    vendor/samsung/e1s/proprietary/vendor/firmware/tsp_stm/fts2ba61c_e1.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/tsp_stm/fts2ba61c_e1.bin \
    vendor/samsung/e1s/proprietary/vendor/firmware/tsp_stm/fts2ba61c_e1.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/tsp_stm/fts2ba61c_e1.bin \
    vendor/samsung/e1s/proprietary/vendor/firmware/tsp_stm/fts2ba61y_e1s.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/tsp_stm/fts2ba61y_e1s.bin \
    vendor/samsung/e1s/proprietary/vendor/firmware/tsp_stm/fts2ba61y_e1s.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/tsp_stm/fts2ba61y_e1s.bin \
    vendor/samsung/e1s/proprietary/vendor/firmware/vl53l8.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/vl53l8.bin \
    vendor/samsung/e1s/proprietary/vendor/firmware/vl53l8.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/vl53l8.bin

# Recovery
PRODUCT_PACKAGES += \
    linker.recovery \
    shell_and_utilities_recovery \
    adbd.recovery \
    resize2fs.recovery \
    tune2fs.recovery

# Rootdir
PRODUCT_PACKAGES += \
    hdm_status.sh \
    init.insmod.sh \
    install-recovery.sh

PRODUCT_PACKAGES += \
    fstab.s5e9945 \
    init.recovery.s5e9945.rc \
    init.recovery.samsung.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.s5e9945:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.s5e9945 \
    $(LOCAL_PATH)/rootdir/etc/fstab.s5e9945:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/fstab.s5e9945

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/e1s/e1s-vendor.mk)
