#
# Copyright (C) 2011 The Android Open-Source Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk

# Camera
USE_CAMERA_STUB := false
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_USES_LEGACY_OVERLAY := true

# inherit from the proprietary version
-include vendor/alcatel/brandy/BoardConfigVendor.mk

# CPU
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp

# Target and board properties
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOOTLOADER_BOARD_NAME := brandy
TARGET_SPECIFIC_HEADER_PATH := device/alcatel/brandy/include
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27

# Kernel
# Try build from source
TARGET_KERNEL_SOURCE := kernel/alcatel/brandy
TARGET_KERNEL_CONFIG := cyanogen_brandy_defconfig
# if not present - use prebuilt
TARGET_PREBUILT_KERNEL := device/alcatel/brandy/kernel

BOARD_KERNEL_CMDLINE := mem=458M console=ttyMSM2,115200n8 androidboot.hardware=brandy
BOARD_KERNEL_BASE := 0x13600000
BOARD_KERNEL_PAGESIZE := 2048

# WiFi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WLAN_DEVICE := bcm4329
#BOARD_HOSTAPD_DRIVER := WEXT
#BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_wext
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/fw_bcm4329.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME := "bcm4329"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/librasdioif.ko"
WIFI_EXT_MODULE_NAME := "librasdioif"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := brandy
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_LEGACY_OMX

# Graphics
BOARD_EGL_CFG := device/alcatel/brandy/prebuilt/egl.cfg
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60

# Legacy ts support
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Browser & WebKit
JS_ENGINE := v8
HTTP := chrome
WITH_JIT := true
ENABLE_JSC_JIT := true
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Libs
TARGET_PROVIDES_LIBLIGHTS := true
BOARD_PROVIDES_LIBRIL := true

# Recovery
TARGET_RECOVERY_INITRC := device/alcatel/brandy/recovery/init.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/alcatel/brandy/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../device/alcatel/brandy/recovery/graphics.c
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

# # cat /proc/mtd
# dev:     size   erasesize  name
# mtd0:  005c0000 00020000 "boot"
# mtd1:  03c00000 00020000 "cache"
# mtd2:  00500000 00020000 "recovery"
# mtd3:  000c0000 00020000 "splash"
# mtd4:  00040000 00020000 "misc"
# mtd5:  05f00000 00020000 "system"
# mtd6:  07300000 00020000 "custpack"
# mtd7:  09e60000 00020000 "userdata"
# mtd8:  00080000 00020000 "securo"
# mtd9:  00080000 00020000 "studypara"
# mtd10: 00080000 00020000 "tracability"
# mtd11: 000a0000 00020000 "tuningpara"
# mtd12: 1bae0000 00020000 ""
# mtd13: 00040000 00020000 "FOTAFLAG"
# mtd14: 01b40000 00020000 "FOTA"

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x005C0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0D200000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09E60000
BOARD_FLASH_BLOCK_SIZE := 131072

# TWRP
DEVICE_RESOLUTION := 320x480
SP1_NAME := "custpack"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1
TW_BOARD_CUSTOM_GRAPHICS := ../../../device/alcatel/brandy/recovery/twrpgraphics.c
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
