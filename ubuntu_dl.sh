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

VERSION=saucy

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

