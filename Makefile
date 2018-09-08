all: boot splash rootfs

.PHONY: boot splash rootfs docker-build

boot:
	$(MAKE) -C boot

splash:
	$(MAKE) -C splash

rootfs: docker-build
	$(MAKE) -C rootfs

docker-build:
	$(MAKE) -C docker-build 14.04

flash: boot
	$(MAKE) -C boot flash
	$(MAKE) -C splash flash

clean:
	$(MAKE) -C boot clean
	$(MAKE) -C splash clean
	$(MAKE) -C rootfs clean

