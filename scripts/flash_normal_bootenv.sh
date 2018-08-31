#!/bin/bash
echo "Zeroing normal env area"
dd if=/dev/zero of=/dev/mmcblk2 bs=512 seek=$((0x00f00000/512)) count=$((0x00020000/512))
echo "Flashing env"
dd if=bootenv of=/dev/mmcblk2 bs=512 seek=$((0x00f00000/512))
echo "Synching"
sync; sync; sync
