FROM ubuntu:12.04

RUN apt-get -y update
RUN apt-get install -y emdebian-archive-keyring

#RUN "printf \"ndeb http://www.emdebian.org/debian/ unstable main\n" >> /etc/apt/sources.list

#apt-get update

RUN apt-get install -y build-essential git bison autoconf gperf flex texinfo help2man gawk libtool libncurses5-dev unzip bc
RUN apt-get install -y pkg-config-arm-linux-gnueabihf
RUN apt-get install -y u-boot-tools uboot-mkimage
RUN apt-get install -y wget vim 
RUN apt-get install -y ia32-libs
