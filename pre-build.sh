#!/bin/bash
# 1. Исправляем лимит в утилите сборки TP-Link (самое важное!)
find padavan-ng/trunk/vendors/Mediatek -name "Makefile" -exec sed -i 's/7864320/16252928/g' {} +

# 2. Поиск и правка DTS файлов (разметка железа)
find padavan-ng/trunk/linux-3.4.x/arch/mips/boot/dts -name "*archer-c5-v4*" -type f -exec sed -i 's/0x7c0000/0xfc0000/g' {} +
find padavan-ng/trunk/linux-3.4.x/arch/mips/boot/dts -name "*archer-c5-v4*" -type f -exec sed -i 's/0x7f0000/0xff0000/g' {} +

# 3. Правка лимитов для скрипта проверки размера
find padavan-ng/trunk/configs/boards -name "partitions.config" -path "*C5-V4*" -exec sed -i 's/Firmware, 0x30000, .*/Firmware, 0x30000, 16515072/g' {} +

# 4. Включаем флаг 16М в конфиге
sed -i 's/CONFIG_FIRMWARE_SIZE_16M=n/CONFIG_FIRMWARE_SIZE_16M=y/g' padavan-ng/trunk/.config
