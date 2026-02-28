#!/bin/bash

# 1. Автоматический поиск и правка всех .dts файлов для Archer C5 V4
find padavan-ng/trunk/linux-3.4.x/arch/mips/boot/dts -name "*archer-c5-v4*" -exec sed -i 's/0x7c0000/0xfc0000/g' {} +
find padavan-ng/trunk/linux-3.4.x/arch/mips/boot/dts -name "*archer-c5-v4*" -exec sed -i 's/0x7f0000/0xff0000/g' {} +

# 2. Автоматический поиск и правка partitions.config
find padavan-ng/trunk/configs/boards -name "partitions.config" -path "*C5-V4*" -exec sed -i 's/Firmware, 0x30000, .*/Firmware, 0x30000, 16515072/g' {} +

# 3. Принудительное увеличение лимита размера образа в скрипте сборки ядра
sed -i 's/CONFIG_FIRMWARE_SIZE_16M=n/CONFIG_FIRMWARE_SIZE_16M=y/g' padavan-ng/trunk/.config
