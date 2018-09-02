all: bootenv splash

bootenv: boot-env.txt 
	$(MAKE) -C mkubootenv
	mkubootenv/mkubootenv -s 131072 boot-env.txt bootenv

.PHONY: splash clean flash
splash:
	$(MAKE) -C splash

FLASH_DEVICE ?=
flash:
ifeq ($(FLASH_DEVICE),)
	@echo Please specify target device with the FLASH_DEVICE variable
else
ifeq ("$(wildcard bootenv.bak)","")
	@echo Backing up current bootenv
	../scripts/extract_normal_bootenv.sh $(FLASH_DEVICE) > bootenv.bak
	@echo Flashing...
	../scripts/flash_normal_bootenv.sh $(FLASH_DEVICE)
	@echo Done.
	
	$(MAKE) -C splash flash
else
	@echo "Error: backup already exists, aborting"
endif
endif

clean:
	rm -f bootenv
	$(MAKE) -C splash clean
