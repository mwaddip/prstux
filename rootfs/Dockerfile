FROM prstux-base:latest

# extra packages
COPY configs/etc/apt/sources.list /etc/apt/sources.list
RUN apt update -y && apt install -y kmod vim iproute2 net-tools ifupdown wireless-tools netbase
RUN apt install -y wpasupplicant file inetutils-ping less

# create mount points
RUN mkdir /mnt/data
RUN mkdir /system

# configs
COPY configs/etc/ /etc/

# set options
RUN bash -c 'echo root:root | chpasswd'

# identify as prstux (helps koreader identifying the device)
RUN touch /etc/PRSTUX

# binaries
COPY bin/modules /lib/modules
COPY bin/wmiconfig/wmiconfig /usr/sbin/wmiconfig
