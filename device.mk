#
# Copyright 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# API levels
PRODUCT_SHIPPING_API_LEVEL := 34

# Fastbootd
PRODUCT_PACKAGES += fastbootd

# GPU Firmware
PRODUCT_COPY_FILES += \
    vendor/samsung/e1s/proprietary/recovery/root/lib/firmware/sgpu/vangogh_lite_unified_evt1.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/firmware/sgpu/vangogh_lite_unified_evt1.bin

# Graphics Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-latest.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.example \
    android.hardware.health-service.example_recovery

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init/fstab.s5e9945:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.s5e9945 \
    $(LOCAL_PATH)/configs/init/fstab.s5e9945:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/fstab.s5e9945 \
    $(LOCAL_PATH)/configs/init/init.recovery.s5e9945.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.s5e9945.rc \
    $(LOCAL_PATH)/configs/init/vendor/init.debug.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.debug.rc \
    $(LOCAL_PATH)/configs/init/vendor/init.s5e9945.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.s5e9945.rc

# Kernel Modules
PRODUCT_COPY_FILES += /dev/null:$(TARGET_COPY_OUT_RECOVERY)/root/dev/null
PRODUCT_PACKAGES += \
    linker.vendor_ramdisk \
    toolbox.vendor_ramdisk

# Keystore Permissions
PRODUCT_COPY_FILES += \
    hardware/interfaces/security/keymint/aidl/default/android.hardware.hardware_keystore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hardware_keystore.xml \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml \
    frameworks/native/data/etc/android.hardware.strongbox_keystore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.strongbox_keystore.xml

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_PACKAGES += vndservicemanager


# Proprietary files
$(call inherit-product, vendor/samsung/e1s/e1s-vendor.mk)
