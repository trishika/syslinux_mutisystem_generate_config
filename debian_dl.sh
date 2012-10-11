#!/bin/sh

VERSION=squeeze
#VERSION=wheezy

mkdir $VERSION

__dl()
{
	mkdir $VERSION/$1
	wget "http://ftp.fr.debian.org/debian/dists/$VERSION/main/installer-$1/current/images/netboot/debian-installer/$1/$2" -O $VERSION/$1/$2
}

__dl i386 initrd.gz
__dl i386 linux

__dl amd64 initrd.gz
__dl amd64 linux

