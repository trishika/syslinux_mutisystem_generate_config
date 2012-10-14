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

rm pxe_bak.tar.bz2

tar cvfj pxe_bak.tar.bz2 README pxelinux.cfg syslinux.cfg vesamenu.c32 pxelinux.0 mkconfig.sh bak.sh image/*/*.sh image_tools/*/dl.sh image_tools/gparted image_tools/memtest

