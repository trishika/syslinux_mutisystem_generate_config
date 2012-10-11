#!/bin/sh

VERSION=quantal
#VERSION=natty

if [ $# -gt 0 ]
 then
	VERSION=$1
fi

mkdir $VERSION

__dl()
{
	mkdir $VERSION/$1
	wget "http://archive.ubuntu.com/ubuntu/dists/$VERSION/main/installer-$1/current/images/netboot/ubuntu-installer/$1/$2" -O $VERSION/$1/$2
}

__dl amd64 initrd.gz
__dl amd64 linux

__dl i386 initrd.gz
__dl i386 linux

