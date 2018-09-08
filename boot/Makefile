.PHONY: clean flash

DEVICE ?=

all: bootenv

mkubootenv/mkubootenv:
	$(MAKE) -C mkubootenv

# boot environment creation
bootenv: boot-env.txt mkubootenv/mkubootenv
	mkubootenv/mkubootenv -s 131072 boot-env.txt bootenv

# backup of boot environment
bootenv.bak: 
ifeq ($(DEVICE),)
	@echo Please specify target device with the DEVICE variable
else
	@echo Backing up current bootenv
	../scripts/extract_normal_bootenv.sh $(DEVICE) > bootenv.bak
endif

# boot environment and splash image flashing
flash: bootenv bootenv.bak
ifeq ($(DEVICE),)
	@echo Please specify target device with the DEVICE variable
else
	@echo Flashing...
	../scripts/flash_normal_bootenv.sh $(DEVICE)
	@echo Done.
endif

clean:
	rm -f bootenv
