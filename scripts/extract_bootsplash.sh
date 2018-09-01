#!/bin/bash
dd if=/dev/mmcblk2 of=bootsplash bs=1 skip=$((0x01000000)) count=$((800*600))
md5sum bootsplash
