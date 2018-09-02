all: boot rootfs

.PHONY: boot rootfs docker-build

boot:
	$(MAKE) -C boot

rootfs: docker-build
	$(MAKE) -C rootfs

docker-build:
	$(MAKE) -C docker-build 14.04

flash: boot
	$(MAKE) -C boot flash

clean:
	$(MAKE) -C boot clean
	$(MAKE) -C rootfs clean

