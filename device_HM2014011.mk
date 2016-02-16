$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# The gps config appropriate for this device
# $(call inherit-product, device/common/gps/gps_us_supl.mk)

# Enable dex-preoptimization, but we have both limited space in the system and data partitions.
PRODUCT_DEX_PREOPT_DEFAULT_FLAGS := --compiler-filter=interpret-only
$(call add-product-dex-preopt-module-config,services,--compiler-filter=space)

$(call inherit-product-if-exists, vendor/Xiaomi/HM2014011/HM2014011-vendor.mk)

LOCAL_PATH := device/Xiaomi/HM2014011

PRODUCT_CHARACTERISTICS := default

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif




# Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/sbin/busybox:root/sbin/busybox \
    $(LOCAL_PATH)/rootdir/fstab.mt6582:root/fstab.mt6582 \
    $(LOCAL_PATH)/rootdir/init.recovery.mt6582.rc:root/init.recovery.mt6582.rc \
    $(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
    $(LOCAL_PATH)/rootdir/init.mt6582.rc:root/init.mt6582.rc \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mt6582.rc:root/ueventd.mt6582.rc \
    $(LOCAL_PATH)/rootdir/init.mt6582.usb.rc:root/init.mt6582.usb.rc \
    $(LOCAL_PATH)/rootdir/twrp.fstab:root/etc/twrp.fstab \
    $(LOCAL_KERNEL):kernel




PRODUCT_NAME := full_HM2014011
PRODUCT_DEVICE := HM2014011


$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
