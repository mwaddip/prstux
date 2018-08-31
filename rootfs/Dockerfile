FROM prstux-base:latest

# extra packages
COPY configs/etc/apt/sources.list /etc/apt/sources.list
RUN apt update -y && apt install -y kmod vim iproute2 net-tools ifupdown wireless-tools netbase
RUN apt install -y wpasupplicant file inetutils-ping less

# configs
COPY configs/etc/fstab /etc/fstab
COPY configs/etc/modules /etc/modules
COPY configs/etc/modprobe.d/g_multi.conf /etc/modprobe.d/g_multi.conf
COPY configs/etc/inittab /etc/inittab
COPY configs/etc/securetty /etc/securetty
COPY configs/etc/network/interfaces /etc/network/interfaces
COPY configs/etc/rc.local /etc/rc.local

# set options
RUN bash -c 'echo root:root | chpasswd'

# identify as prstux (helps koreader identifying the device)
RUN touch /etc/PRSTUX

# binaries
COPY bin/modules /lib/modules
COPY bin/system /system 
