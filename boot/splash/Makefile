bootsplash.bin: splash.png
	convert splash.png -size 800x600 -depth 8 gray:bootsplash.bin

.PHONY: flash clean

FLASH_DEVICE ?=
flash:
ifeq ($(FLASH_DEVICE),)
	@echo Please specify target device with the FLASH_DEVICE variable
else
ifeq ("$(wildcard bootsplash.bin.bak)","")
	@echo Backing up current bootplash image
	../../scripts/extract_bootsplash.sh $(FLASH_DEVICE) > bootsplash.bin.bak
	@echo Flashing...
	../../scripts/flash_bootsplash.sh $(FLASH_DEVICE)
	@echo Done.
else
	@echo "Error: backup already exists, aborting"
endif
endif

clean:
	rm -f bootsplash.bin

all: bootsplash.bin
