# Includes
$(call inherit-product, device/mdpi-common/mdpi.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)
#$(call inherit-product, vendor/google/gapps_armv6_tiny.mk)
$(call inherit-product-if-exists, vendor/alcatel/brandy/brandy-vendor.mk)

LOCAL_PATH := device/alcatel/brandy
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.brandy.rc:root/init.brandy.rc \
    $(LOCAL_PATH)/init.brandy.usb.rc:root/init.brandy.usb.rc \
    $(LOCAL_PATH)/ueventd.brandy.rc:root/ueventd.brandy.rc \
    $(LOCAL_PATH)/prebuilt/initlogo.rle:root/initlogo.rle

# Maybe unneeded
#PRODUCT_PACKAGES += \
#    hwaddrs

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.opengles.surface.rgb565=true \
    com.qc.hardware=true \
    debug.enabletr=false \
    debug.hwui.render_dirty_regions=false \
    debug.qctwa.statusbar=1 \
    debug.qctwa.preservebuf=1 \
    hwui.print_config=choice \
    persist.sys.strictmode.visual=false

# Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true

# Camcorder
PRODUCT_PROPERTY_OVERRIDES += \
    debug.camcorder.disablemeta=1

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0 \
    dalvik.vm.heaptargetutilization=0.25

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x27 \
    audio.primary.msm7x27 \
    audio.a2dp.default \
    libaudioutils

# Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    gralloc.msm7x27 \
    copybit.msm7x27

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27 \

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x27 \
    librpc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/wifi/bcm4329.ko:system/lib/modules/bcm4329.ko \
    $(LOCAL_PATH)/prebuilt/wifi/librasdioif.ko:system/lib/modules/librasdioif.ko \
    $(LOCAL_PATH)/prebuilt/wifi/fw_bcm4329.bin:system/etc/wifi/fw_bcm4329.bin \
    $(LOCAL_PATH)/prebuilt/wifi/fw_bcm4329_apsta.bin:system/etc/wifi/fw_bcm4329_apsta.bin \
    $(LOCAL_PATH)/prebuilt/wifi/nvram.txt:system/etc/wifi/nvram.txt \
    $(LOCAL_PATH)/prebuilt/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# fm radio
PRODUCT_PACKAGES += \
    Effem \
    libfmradio.bcm4325

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml

# Media
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore \
    libdivxdrmdecrypt

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/fstab.brandy:root/fstab.brandy

# Keys
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/keys/7k_ffa_keypad.kcm.bin:system/usr/keychars/7k_ffa_keypad.kcm.bin \
    $(LOCAL_PATH)/prebuilt/keys/7k_ffa_keypad.kl:system/usr/keylayout/7k_ffa_keypad.kl \
    $(LOCAL_PATH)/prebuilt/keys/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/prebuilt/keys/ft5x02-touchscreen.idc:system/usr/idc/ft5x02-touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/keys/ft5x02-touchscreen.kl:system/usr/keylayout/ft5x02-touchscreen.kl

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    lights.msm7x27 \
    lgapversion \
    bdaddr_read \
    Torch

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=0 \
    ro.product.camera=msm7x27 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.setupwizard.enable_bypass=1 \
    ro.telephony.call_ring.multiple=false \
    com.qc.hdmi_out=false \
    debug.sf.hw=1 \
    debug.composition.type=mdp \
    debug.gr.numframebuffers=3 \
    persist.sys.purgeable_assets=1 \
    persist.service.adb.enable=1

# Live wallpapers
PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# init.d
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/init.d/22ksm:system/etc/init.d/22ksm

# Product
PRODUCT_NAME := brandy
PRODUCT_DEVICE := brandy
PRODUCT_MODEL := ALCATEL ONE TOUCH 990
PRODUCT_MANUFACTURER := TCT

# MDPI assets
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/alcatel/brandy/overlay
