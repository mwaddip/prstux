#!/bin/bash
if [ "$1" != "" ]; then
  echo "Flashing bootsplash"
  dd if=bootsplash.bin of=$1 bs=1 seek=$((0x01000000)) count=$((800*600))
  echo "Synching"
  sync; sync; sync
else
  echo "usage $(basename $0): <device>"
  exit 1
fi
