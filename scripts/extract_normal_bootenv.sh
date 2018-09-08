#!/bin/bash
set -x
if [ "$1" != "" ]; then
  sudo dd if=$1 bs=512 skip=$((0x00f00000/512)) count=$((0x00020000/512))
else
  echo "usage: $(basename $0) <flash device>"
  exit 1
fi
