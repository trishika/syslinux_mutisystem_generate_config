#!/bin/bash

sym=0

if [ $@ = 0 ]; then
	echo "Missing installation dir"
	exit
fi

__install()
{
	if [ $sym = 1 ]; then
		ln -s `realpath $1` $2
	else
		cp $1 $2
	fi
}

__install bak.sh $1
__install dlall.sh $1
__install mkconfig.sh $1
__install README $1
__install syslinux.cfg $1
cp -R pxelinux.cfg $1

mkdir $1/image

mkdir $1/image/archlinux
__install archlinux_dl.sh $1/image/archlinux/dl.sh

mkdir $1/image/centos
__install centos_dl.sh $1/image/centos/dl.sh

mkdir $1/image/debian
__install debian_dl.sh $1/image/debian/dl.sh

mkdir $1/image/fedora
__install fedora_dl.sh $1/image/fedora/dl.sh

mkdir $1/image/ubuntu
__install ubuntu_dl.sh $1/image/ubuntu/dl.sh

mkdir $1/image_live

mkdir $1/image_live/debian-live
__install debian_dl-live.sh $1/image_live/debian-live/dl-live.sh
