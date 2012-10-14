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

__dl()
{
	mkdir $2
	wget "http://mir1.archlinux.fr/archlinux/iso/archboot/latest/boot/$1" -O $2/$3
}

__dl initramfs_i686.img x86_32 initrd.img
__dl vmlinuz_i686 x86_32 vmlinuz

__dl initramfs_x86_64.img x86_64 initrd.img
__dl vmlinuz_x86_64 x86_64 vmlinuz
