#!/bin/bash
if [ "$1" != "" ]; then
  echo "Will flash into device: $1"
  echo -n "Continue? Type 'yes': "
  read answer
  if [ "$answer" = "yes" ]; then
    set -x
    echo "Zeroing normal env area"
    sudo dd if=/dev/zero of=$1 bs=512 seek=$((0x00f00000/512)) count=$((0x00020000/512))
    echo "Flashing env"
    sudo dd if=bootenv of=$1 bs=512 seek=$((0x00f00000/512)) count=$((0x00020000/512))
    sudo dd if=bootenv of=$1 bs=512 seek=$((0x000c0000/512)) count=$((0x00020000/512))
    echo "Synching"
    sync; sync; sync
  else
    echo "Aborted"
  fi
else
  echo "usage: $(basename $0): <flash device>"
  exit 1
fi
