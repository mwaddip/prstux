all: bootenv splash

bootenv: boot-env.txt 
	$(MAKE) -C mkubootenv
	mkubootenv/mkubootenv -s 131072 boot-env.txt bootenv

.PHONY: splash
splash:
	$(MAKE) -C splash


