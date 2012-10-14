#!/bin/sh
#
# Copyright (C) 2012 Aurélien Chabot <aurelien@chabot.fr>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

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
