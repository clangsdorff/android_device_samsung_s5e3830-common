#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: 2026 Langsdorff
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/samsung/s5e3830-common

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
# exynos 850 a55 lacks dotprod, -mcpu=cortex-a55 would emit sdot/udot
TARGET_CPU_VARIANT := cortex-a53
# dex2oat intersects the variant with hwcap on device, so dotprod stays off
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/configs/config.fs

# Boot image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_USE_LZ4 := true

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true

# Dynamic partitions
BOARD_SUPER_PARTITION_GROUPS := group_basic

-include vendor/lineage/config/BoardConfigReservedSize.mk

# Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system/system_ext
TARGET_COPY_OUT_VENDOR := vendor

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Graphics
TARGET_USES_VULKAN := false

# Display
TARGET_SCREEN_DENSITY := 450

# Dexpreopt
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
DONT_DEXPREOPT_PREBUILTS := false

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CLANG_PATH := $(abspath prebuilts/clang/kernel/linux-x86/clang-r450784d)

# Partitions
BOARD_USES_METADATA_PARTITION := true
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_ROOT_EXTRA_FOLDERS := efs

BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := erd3830
TARGET_BOOTLOADER_BOARD_NAME := exynos3830
TARGET_SOC := s5e3830
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Init
$(call soong_config_set,libinit,vendor_init_lib,//$(COMMON_PATH):libinit_s5e3830)

# RIL
$(call soong_config_set,cbd,protocol,sipc)

# Codec2
$(call soong_config_set_bool,samsungCodec2Vars,uses_exynos_component_store,true)

# Properties
TARGET_VENDOR_PROP += $(COMMON_PATH)/configs/props/vendor.prop

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Security patch
VENDOR_SECURITY_PATCH := 2026-05-05

# SELinux
BOARD_SEPOLICY_TEE_FLAVOR := teegris
include device/samsung_slsi/sepolicy/sepolicy.mk
include device/lineage/sepolicy/exynos/sepolicy.mk

BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# Verified boot
BOARD_AVB_ENABLE := true
ifneq ($(wildcard vendor/lineage-priv/keys/avb.pk8),)
BOARD_AVB_KEY_PATH := vendor/lineage-priv/keys/avb.pk8
BOARD_AVB_ALGORITHM := SHA256_RSA4096
endif
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# VINTF
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/configs/vintf/manifest.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/configs/vintf/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(COMMON_PATH)/configs/vintf/framework_compatibility_matrix.xml \
    hardware/samsung/vintf/samsung_framework_compatibility_matrix.xml

# Wi-Fi
BOARD_WLAN_DEVICE := slsi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_slsi
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_slsi
WIFI_HAL_INTERFACE_COMBINATIONS := {{{STA}, 1}, {{AP}, 1}, {{P2P}, 1}}
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
