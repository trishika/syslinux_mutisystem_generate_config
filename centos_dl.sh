#!/bin/sh

VERSION=6

mkdir $VERSION

__dl()
{
	mkdir $VERSION/$1
	wget "http://isoredirect.centos.org/centos/$VERSION/os/$1/images/pxeboot/$2" -O $VERSION/$1/$2
}

__dl x86_64 initrd.img
__dl x86_64 vmlinuz

__dl i386 initrd.img
__dl i386 vmlinuz

