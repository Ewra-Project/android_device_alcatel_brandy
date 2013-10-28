-include vendor/alcatel/brandy/BoardConfigVendor.mk

# Target
TARGET_ARCH := arm
TARGET_ARCH_LOWMEM := true
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOOTLOADER_BOARD_NAME := brandy
TARGET_SPECIFIC_HEADER_PATH := device/alcatel/brandy/include
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := arm11
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27

# Kernel
# Try build from source
TARGET_KERNEL_SOURCE := kernel/alcatel/brandy
TARGET_KERNEL_CONFIG := cyanogen_brandy_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
# if not present - use prebuilt
TARGET_PREBUILT_KERNEL := device/alcatel/brandy/kernel

BOARD_KERNEL_CMDLINE := mem=458M console=ttyMSM2,115200n8 androidboot.hardware=brandy
BOARD_KERNEL_BASE := 0x13600000
BOARD_KERNEL_PAGESIZE := 2048

# Partition Sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x005C0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0D200000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09E60000
BOARD_FLASH_BLOCK_SIZE := 131072

# Graphics
USE_OPENGL_RENDERER := true
TARGET_NO_HW_OVERLAY := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/alcatel/brandy/prebuilt/egl.cfg
BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
TARGET_NO_HW_VSYNC := false
COMMON_GLOBAL_CFLAGS += -DANCIENT_GL
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK

# Camera
TARGET_DISABLE_ARM_PIE := true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_USES_QCOM_LEGACY_CAM_PARAMS := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT

# WiFi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcm4329
#BOARD_WEXT_NO_COMBO_SCAN := true
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/fw_bcm4329.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME := "bcm4329"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/fw_bcm4329_apsta.bin"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/librasdioif.ko"
WIFI_EXT_MODULE_NAME := "librasdioif"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Audio & FM Radio
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_AUDIO_LEGACY := false
BOARD_COMBO_DEVICE_SUPPORTED := false

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE_LEGACY := msm7x27

# RIL
BOARD_PROVIDES_LIBRIL := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"

# Touch screen compatibility
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Minimal fonts
SMALLER_FONT_FOOTPRINT := true

# Recovery
TARGET_RECOVERY_FSTAB := device/alcatel/brandy/fstab.brandy
TARGET_RECOVERY_INITRC := device/alcatel/brandy/recovery/init.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/alcatel/brandy/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../device/alcatel/brandy/recovery/graphics.c

# Javascript, Browser and Webkit
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# TWRP
DEVICE_RESOLUTION := 320x480
SP1_NAME := "custpack"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1
TW_BOARD_CUSTOM_GRAPHICS := ../../../device/alcatel/brandy/recovery/twrpgraphics.c
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255

# # cat /proc/mtd
# dev: size erasesize name
# mtd0: 005c0000 00020000 "boot"
# mtd1: 03c00000 00020000 "cache"
# mtd2: 00500000 00020000 "recovery"
# mtd3: 000c0000 00020000 "splash"
# mtd4: 00040000 00020000 "misc"
# mtd5: 05f00000 00020000 "system"
# mtd6: 07300000 00020000 "custpack"
# mtd7: 09e60000 00020000 "userdata"
# mtd8: 00080000 00020000 "securo"
# mtd9: 00080000 00020000 "studypara"
# mtd10: 00080000 00020000 "tracability"
# mtd11: 000a0000 00020000 "tuningpara"
# mtd12: 1bae0000 00020000 ""
# mtd13: 00040000 00020000 "FOTAFLAG"
# mtd14: 01b40000 00020000 "FOTA"

