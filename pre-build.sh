#!/bin/bash
# 1. Поиск всех DTS файлов для Archer C5 V4 и замена лимитов на 16МБ
find padavan-ng/trunk/linux-3.4.x/arch/mips/boot/dts -name "*archer-c5-v4*" -type f -exec sed -i 's/0x7c0000/0xfc0000/g' {} +
find padavan-ng/trunk/linux-3.4.x/arch/mips/boot/dts -name "*archer-c5-v4*" -type f -exec sed -i 's/0x7f0000/0xff0000/g' {} +

# 2. Поиск partitions.config для вашей модели и обновление лимита для скрипта проверки
find padavan-ng/trunk/configs/boards -name "partitions.config" -path "*C5-V4*" -exec sed -i 's/Firmware, 0x30000, .*/Firmware, 0x30000, 16515072/g' {} +

# 3. Принудительная установка флага 16М в конфиге
sed -i 's/CONFIG_FIRMWARE_SIZE_16M=n/CONFIG_FIRMWARE_SIZE_16M=y/g' padavan-ng/trunk/.config
