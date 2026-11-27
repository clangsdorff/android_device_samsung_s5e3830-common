#
# SPDX-FileCopyrightText: 2026 Langsdorff
# SPDX-License-Identifier: Apache-2.0
#

TARGET_EXCLUDE_ADB_ROOT := true
TARGET_EXCLUDES_AUDIOFX := true
TARGET_EXCLUDE_LOS_EXTRA_CLI_UTILS := true
TARGET_SKIP_BACKUPTOOL := true

# Inherit some common Lineage stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# GApps
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)

$(foreach m,\
    AndroidAutoStub \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter \
    GoogleFeedback \
    GoogleRestore \
    GoogleServicesFramework \
    MarkupGoogle_v2 \
    Phonesky \
    PrebuiltExchange3Google \
    SpeechServicesByGoogle \
    Velvet \
    VelvetTitan \
    com.google.android.dialer.support \
    talkback,\
    $(call add-product-dex-preopt-module-config,$(m),disable))
