#
# SPDX-FileCopyrightText: 2026 Langsdorff
# SPDX-License-Identifier: Apache-2.0
#

TARGET_EXCLUDES_AUDIOFX := true
TARGET_DISABLE_MATLOG := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := false

# Inherit some common Lineage stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# GApps
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)

