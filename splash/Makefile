.PHONY: flash clean

DEVICE ?=

bootsplash.bin: splash.png
	convert splash.png -size 800x600 -depth 8 gray:bootsplash.bin

bootsplash.bin.bak: 
ifeq ($(DEVICE),)
	@echo Please specify target device with the DEVICE variable
else
        @echo Backing up current bootplash image
        ../../scripts/extract_bootsplash.sh $(DEVICE) > bootsplash.bin.bak
endif

flash: bootsplash.bin bootsplash.bin.bak
ifeq ($(DEVICE),)
	@echo Please specify target device with the DEVICE variable
else
	@echo Flashing...
	../../scripts/flash_bootsplash.sh $(DEVICE)
	@echo Done.
endif

clean:
	rm -f bootsplash.bin

all: bootsplash.bin
