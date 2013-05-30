## MDPI assets
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
$(call inherit-product, device/mdpi-common/mdpi.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit hdpi 512
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/alcatel/brandy/brandy-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/alcatel/brandy/overlay

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

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Keys
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/keys/7k_ffa_keypad.kcm.bin:system/usr/keychars/7k_ffa_keypad.kcm.bin \
    $(LOCAL_PATH)/prebuilt/keys/7k_ffa_keypad.kl:system/usr/keylayout/7k_ffa_keypad.kl \
    $(LOCAL_PATH)/prebuilt/keys/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/prebuilt/keys/ft5x02-touchscreen.idc:system/usr/idc/ft5x02-touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/keys/ft5x02-touchscreen.kl:system/usr/keylayout/ft5x02-touchscreen.kl

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/wifi/bcm4329.ko:system/lib/modules/bcm4329.ko \
    $(LOCAL_PATH)/prebuilt/wifi/librasdioif.ko:system/lib/modules/librasdioif.ko \
    $(LOCAL_PATH)/prebuilt/wifi/fw_bcm4329.bin:system/etc/wifi/fw_bcm4329.bin \
    $(LOCAL_PATH)/prebuilt/wifi/fw_bcm4329_apsta.bin:system/etc/wifi/fw_bcm4329_apsta.bin \
    $(LOCAL_PATH)/prebuilt/wifi/nvram.txt:system/etc/wifi/nvram.txt \
    $(LOCAL_PATH)/prebuilt/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# init.d
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/init.d/22ksm:system/etc/init.d/22ksm

# Audio
PRODUCT_PACKAGES += \
    audio_policy.brandy \
    audio.primary.brandy \
    audio.a2dp.default \
    libaudioutils

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27

# Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    gralloc.msm7x27 \
    copybit.msm7x27
#    hwcomposer.msm7x27

# Misc
PRODUCT_PACKAGES += \
    gps.brandy \
    lights.brandy \
    bdaddr_read \
    com.android.future.usb.accessory \
    Torch

# Media
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=msm7x27 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.surface.rgb565=true \
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

$(call inherit-product, build/target/product/full.mk)

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := brandy
PRODUCT_DEVICE := brandy
PRODUCT_MODEL := ALCATEL ONE TOUCH 990
