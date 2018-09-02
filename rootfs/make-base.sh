#!/bin/bash 

if [ "$(docker images -q prstux-base)" = "" ]; then

  set -e

  sudo rm -rf rootfs/
  mkdir rootfs/

  docker run --privileged -ti --rm -v $(pwd)/rootfs:/rootfs prstux-dev:14.04 qemu-debootstrap --arch=armhf --variant=buildd --include=sysvinit-core,sysvinit-utils,openssh-server --exclude=systemd jessie /rootfs http://ftp.debian.org/debian/

  sudo tar -C rootfs -c . | docker import - prstux-base:latest
  sudo rm -rf rootfs/
else
  echo "prstux-base docker image already exists. use make clean_base to remove if you want to rebuild it"
  exit 0
fi
