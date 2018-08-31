#!/bin/bash
echo "Zeroing normal rootfs area"
dd if=/dev/zero of=/dev/mmcblk2 bs=512 seek=$((0x00500000/512)) count=$((0x00100000/512))
echo "Flashing kernel"
dd if=root.img of=/dev/mmcblk2 bs=512 seek=$((0x00500000/512))
echo "Synching"
sync; sync; sync
