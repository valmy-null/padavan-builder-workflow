bash
#!/bin/bash
# Авто-правка лимита в конфиге
sed -i 's/Firmware, 0x30000, .*/Firmware, 0x30000, 16515072/g' padavan-ng/trunk/configs/boards/TPLINK/TL_C5-V4/partitions.config

# Авто-правка разделов в DTS (разметка под 16МБ)
# Внимание: путь ниже может отличаться, проверьте версию ядра (3.4.x или 4.4.x)
DTS_FILE="padavan-ng/trunk/linux-3.4.x/arch/mips/boot/dts/rt5650_tplink_archer-c5-v4.dts"
sed -i 's/0x7c0000/0xfc0000/g' $DTS_FILE
sed -i 's/0x7f0000/0xff0000/g' $DTS_FILE
