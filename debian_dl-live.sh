#!/bin/sh

VERSION=6.0.5

__dl()
{
	SUFIX=""
	if [ "$3" != "squashfs" ]; then
		SUFIX="-2.6.32-5-$2"
	fi

	mkdir "$VERSION-$DISTRIB/$1"
	wget "http://cdimage.debian.org/cdimage/release/$VERSION-live/$1/web/debian-live-$VERSION-$1-$DISTRIB.$3$SUFIX" -O "$VERSION-$DISTRIB/$1/$3"

	if [ "$3" = "squashfs" ]; then
		sudo ln -s `pwd`"/$VERSION-$DISTRIB/$1/$3" "/var/www/debian-live-$VERSION-$DISTRIB-$1.$3"
	fi
}

__dl_distrib()
{
	DISTRIB=$1

	mkdir "$VERSION-$DISTRIB"

	#__dl i386 686 initrd.img
	#__dl i386 686 vmlinuz
	#__dl i386 686 squashfs

	__dl amd64 amd64 initrd.img
	__dl amd64 amd64 vmlinuz
	__dl amd64 amd64 squashfs
}

#__dl_distrib rescue
#__dl_distrib standard
#__dl_distrib lxde-desktop
__dl_distrib xfce-desktop
__dl_distrib gnome-desktop
