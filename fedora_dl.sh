#!/bin/sh

VERSION=17

mkdir $VERSION

__dl()
{
	mkdir $VERSION/$1
#	wget "http://mir01.syntis.net/fedora/linux/releases/$VERSION/Fedora/$1/os/images/pxeboot/$2" -O $VERSION/$1/$2
	wget "http://mir01.syntis.net/fedora/linux/releases/$VERSION/Fedora/$1/os/isolinux/$2" -O $VERSION/$1/$2
}

__dl x86_64 initrd.img
__dl x86_64 vmlinuz

__dl i386 initrd.img
__dl i386 vmlinuz

