/*
 * Copyright (C) 2020 Arm Limited.
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "android.hardware.graphics.allocator@4.0-service"

#include <android/hardware/graphics/allocator/4.0/IAllocator.h>

#include <hidl/LegacySupport.h>

using android::hardware::defaultPassthroughServiceImplementation;
using android::hardware::graphics::allocator::V4_0::IAllocator;

int main() {
    return defaultPassthroughServiceImplementation<IAllocator>(/*maxThreads*/ 4);
}
