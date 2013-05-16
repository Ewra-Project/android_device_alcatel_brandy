$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates/export_includes)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),brandy)
include $(call all-makefiles-under,$(call my-dir))
endif
