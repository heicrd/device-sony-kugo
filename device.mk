# Copyright 2014 The Android Open Source Project
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

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/kugo/overlay

PRODUCT_COPY_FILES := \
    device/sony/kugo/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/sony/kugo/rootdir/system/etc/BCM4345.hcd:system/etc/firmware/BCM43xx.hcd \
    device/sony/kugo/rootdir/system/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    device/sony/kugo/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \
    device/sony/kugo/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    device/sony/kugo/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/sony/kugo/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    device/sony/kugo/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths_wcd9335.xml

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# Device Init
PRODUCT_PACKAGES += \
    init.recovery.kugo \
    init.kugo \
    ueventd.kugo

# Lights
PRODUCT_PACKAGES += \
    lights.kugo

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.kugo

# Fingerprint HAL
PRODUCT_PACKAGES += \
    fingerprintd \
    fingerprint.kugo

# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=320 \
    ro.usb.pid_suffix=1E8

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/loire/platform.mk)
$(call inherit-product, vendor/sony/loire-kugo/kugo-vendor.mk)
