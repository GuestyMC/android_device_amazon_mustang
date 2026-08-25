# LineageOS 18.1 for Amazon Fire 7 (2019)

Unofficial LineageOS 18.1 (Android 11) port for the Amazon Fire 7 2019 tablet (codenamed _"mustang"_).

Based on the mt8163/karnak LOS 18.1 stack, ported to the Fire 7 2019 hardware.

## Device Picture

![Fire 7 2019](https://m.media-amazon.com/images/I/71gY9E6MbFL._AC_SL1500_.jpg)

## Specifications

| Component | Details |
|-----------|---------|
| SoC | MediaTek MT8163 |
| CPU | 1.3 GHz quad-core ARM Cortex-A53 |
| GPU | Mali-T720 MP2 |
| RAM | 1 GB |
| Storage | 16 GB / 32 GB |
| Display | 600x1024 IPS, 7.0" |
| Battery | 3750 mAh |
| Connectivity | WiFi 802.11 a/b/g/n/ac, Bluetooth 4.2 |
| Camera | 2 MP rear, 2 MP front |

## Status

| Feature | Status | Notes |
|---------|--------|-------|
| WiFi | ✅ Working | |
| Bluetooth | ✅ Working | |
| Sound (speaker) | ✅ Working | |
| Display | ✅ Working | Flicker-free (LiveDisplay night mode disabled by default) |
| Camera (front) | ✅ Working | |
| Screen recording | ✅ Working | H.264 hardware encoder with fdsan shim |
| Microphone | ❌ Not working | Hardware present, kernel path proven, HAL routing WIP |

## What's included

- **Device tree** (`device/amazon/mustang/`) — complete port for Fire 7 2019
- **Kernel patches** — mustang-specific additions to the karnak kernel (4.9.117):
  - Device trees for mustang_proto and mustang_hvt
  - LCM driver for OTM7290B panel
  - Camera hardware fix for mustang
  - Display idle-switch fix (prevents panel flapping)
- **fdsan shim** — disables fdsan error level in the OMX encoder process (fixes MTK hardware H.264 encoder crash on Android 11)
- **SELinux** — starts permissive (first-boot debugging)

## Installation

### Requirements
- amonet-unlocked bootloader
- TWRP recovery (chaosmaster's amonet-aware version)
- A PC with adb

### Steps

1. **Boot into TWRP:**
   ```
   adb reboot recovery
   ```
   Or power off, then hold **VOL-** while plugging USB → fastboot → `fastboot boot recovery.img`

2. **Wipe data** (required for first install or cross-version update):
   - TWRP → Wipe → Factory Reset

3. **Flash the ROM:**
   - TWRP → Advanced → ADB Sideload
   - On PC:
     ```
     adb sideload lineage-18.1-*-UNOFFICIAL-mustang.zip
     ```

4. **Flash GApps** (required after every ROM flash):
   - Re-enter sideload mode in TWRP (Advanced → ADB Sideload)
   - On PC:
     ```
     adb sideload MindTheGapps-11.0.0-arm-20230922_081034.zip
     ```

5. **Reboot system.** First boot takes several minutes.

## Building

```bash
# Initialize repo
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1
repo sync

# Clone device tree
git clone https://github.com/GuestyMC/android_device_amazon_mustang.git device/amazon/mustang

# Clone kernel (optional, for kernel builds)
git clone https://github.com/GuestyMC/android_kernel_amazon_karnak_4.9.git kernel/amazon/mustang

# Build
source build/envsetup.sh
lunch lineage_mustang-userdebug
mka bacon -j$(nproc)
```

## Known Issues

- **Microphone:** Amazon's blob HAL blocks recording. The RT5518 DSP hardware is present and the kernel path (pcm23 via SPI) is proven working, but the Android audio HAL needs a custom input HAL to route to the DSP. Work in progress.
- **Battery lifetime service:** Crash-looping (vendor blob side bug, harmless — logs only).

## Credits

- **LineageOS team** — for the base ROM and device tree framework
- **chaosmaster** — TWRP, amonet unlock, and karnak kernel work
- **mt8163/karnak maintainers** — upstream kernel and vendor blob work
- **GuestyMC** ([GitHub](https://github.com/GuestyMC)) — Fire 7 2019 (mustang) port, camera fix, display fix, fdsan shim

## License

```
Copyright (C) 2026 The LineageOS Project

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

**Kernel:** This device tree includes kernel modifications licensed under the GNU General Public License v2 (see `kernel/amazon/mustang/COPYING`).
