#!/bin/bash
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

sym=0

export BOLD=$(tput bold)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export NORMAL=$(tput sgr0)
export LINE=$(printf "%78s")
export UNDERLINE=$(tput smul)
export N_UNDERLINE=$(tput rmul)

display_help()
{
	printf "${BOLD}DESCRIPTION${NORMAL}\n"
	printf "\tBuild basic tree in wanting directory\n\n"
	printf "${BOLD}Usage : \n"
	printf "\t${BOLD}./install_version${NORMAL} <destination>\n\n"
	printf "${BOLD}EXEMPLE${NORMAL}\n\t${BOLD}./install.sh${NORMAL} pxe_dir\n"
}


if [ $# = 0 ]; then
	printf "\n${BOLD}${RED}Missing installation dir${NORMAL}\n\n"
	display_help
	exit 1
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
__install README.md $1
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

