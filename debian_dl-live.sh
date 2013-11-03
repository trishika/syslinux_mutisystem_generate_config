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

VERSION=7.2
VERSION_F="${VERSION}.0"

DL_SQUASFS=false

__dl()
{
	mkdir "$VERSION-$DISTRIB/$1"
	url="http://cdimage.debian.org/cdimage/release/$VERSION_F-live/$1/webboot/debian-live-$VERSION-$1-$DISTRIB.$3"

	if [ "$3" = "squashfs" ]; then
		if $DL_SQUASFS ; then
			sudo ln -s `pwd`"/$VERSION-$DISTRIB/$1/$3" "/var/www/debian-live-$VERSION-$DISTRIB-$1.$3"
		else
			echo $url > "$VERSION-$DISTRIB/$1/squashfs.url"
			return
		fi
	fi

	wget $url -O "$VERSION-$DISTRIB/$1/$3"
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
