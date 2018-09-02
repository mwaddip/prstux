#!/bin/bash
if [ "$1" != "" ]; then
  dd if=$1 bs=1 skip=$((0x01000000)) count=$((800*600))
else
  echo "usage: $(basename $0): <device>"
  exit 1
fi
