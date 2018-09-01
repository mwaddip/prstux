#!/bin/bash
echo "Flashing bootsplash"
dd if=bootsplash.bin of=/dev/mmcblk2 bs=1 seek=$((0x01000000)) count=$((800*600))
echo "Synching"
sync; sync; sync
