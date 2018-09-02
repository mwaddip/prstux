#!/bin/bash -x
set -e

# extract filesystem from docker image
sudo rm -rf final_root
docker save prstux | sudo ./undocker.py -o final_root

# create device files
cd final_root
sudo mknod dev/ttyGS0 c 253 0
sudo mknod dev/pastlog c 10 46

sudo mknod dev/mmcblk2 b 179 64
sudo mknod dev/mmcblk2p1 b 179 65
sudo mknod dev/mmcblk2p2 b 179 66
sudo mknod dev/mmcblk2p3 b 179 67
sudo mknod dev/mmcblk2p4 b 179 68
sudo mknod dev/mmcblk2p5 b 179 69
sudo mknod dev/mmcblk2p6 b 179 70
sudo mknod dev/mmcblk2p7 b 179 71
sudo mknod dev/mmcblk2p8 b 179 72
sudo mknod dev/mmcblk2p9 b 179 73
sudo mknod dev/mmcblk2p10 b 179 74

sudo mknod dev/mmcblk0p1 b 179 1
sudo mknod dev/mmcblk0p2 b 179 2

sudo mknod dev/fb0 c 29 0

sudo mkdir dev/input
sudo mknod dev/input/event0 c 13 64
sudo mknod dev/input/event1 c 13 65
sudo mknod dev/input/event2 c 13 66

# we're using RTC1, since it appears to be made for Sony eReader, but I'm not really sure of the difference between both
sudo ln -s dev/rtc1 dev/rtc
sudo mknod dev/rtc0 c 254 0
sudo mknod dev/rtc1 c 254 1

# remove qemu binary for final root
sudo rm -f usr/bin/qemu-arm-static

cd ..

# compress into final tar
sudo tar -C final_root -c . > final_root.tar
sudo rm -rf final_root

