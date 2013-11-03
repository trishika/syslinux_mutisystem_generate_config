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

image_path="image"
image_live_path="image_live"
menu_path="pxelinux.cfg"
host="10.5.1.1"

write_file()
{
	echo "$2" >> "$menu_path/$1.menu"
}

base_menu()
{
	rm $menu_path/$1.menu

	write_file "$1" "MENU TITLE $1"
	write_file "$1" ""
	write_file "$1" "LABEL Main Menu"
	write_file "$1" "    MENU LABEL Return to Main Menu"
	write_file "$1" "    KERNEL vesamenu.c32"
	write_file "$1" "    APPEND pxelinux.cfg/graphics.conf pxelinux.cfg/setup.menu"
	write_file "$1" ""
}

version_menu()
{
	write_file "$1" "MENU BEGIN $1 $2"
	write_file "$1" "MENU TITLE $1 $2"
}

launch_item()
{
	path=$1/$2/$3
	if [ $# -gt 3 ]; then
		path=$path/$4
	fi

	kernel=""
	root=""
	squashfs=""

	# Look for kernel and rootfs file
	for sys in `ls $path`
	do

		if [ "$sys" = "vmlinuz" ] || [ "$sys" = "linux" ]; then
			kernel=$sys
		else
			if [ "$sys" = "initrd.img" ] || [ "$sys" = "initrd.gz" ]; then
				root=$sys
			else
				if [ "$sys" = "filesystem.squashfs" ] || [ "$sys" = "squashfs" ]; then
					squashfs=$sys
				else
					if [ "$sys" = "squashfs.url" ]; then
						url=`cat $path/$sys`
					fi
				fi
			fi
		fi

	done

	if [ "$kernel"!='' ] && [ "$root"!='' ]; then

		args=""
		if [ -f "$path/args" ]; then
			args=`cat $path/args`
		fi

		if [ ! -z "$squashfs" ]; then
			args="$args boot=live config nodhcp fetch=http://$host/$2-$3-$4.$squashfs"
		else
			if [ ! -z "$url" ]; then
				args="$args boot=live config nodhcp fetch=$url"
			fi
		fi

		write_file "$2" "LABEL $2 $3 $4"
		write_file "$2" "    kernel $path/$kernel"
		write_file "$2" "    append vga=normal initrd=$path/$root $args --"
		write_file "$2" ""

	fi
}

menu_end()
{
	write_file "$1" "MENU END"
	write_file "$1" ""
}

inspect()
{
	for distrib in `ls $1`
	do
		if [ -d $1/$distrib ]; then
			echo $distrib
			# Build base menu
			base_menu $distrib

			for version in `ls $1/$distrib`
			do
				if [ -d $1/$distrib/$version ]; then
					echo $version
					if [ "$version" = "x86_32" ] || [ "$version" = "x86_64" ] || [ "$version" = "i386" ] || [ "$version" = "amd64" ]; then
						echo "No version"
						# Build lauch item
						launch_item $1 $distrib $version
					else
						# Build version menu
						version_menu $distrib $version

						for arch in `ls $1/$distrib/$version`
						do
							if [ -d $1/$distrib/$version/$arch ]; then
								# Build launch menu
								launch_item $1 $distrib $version $arch
							fi
						done

						# Close version menu
						menu_end $distrib
					fi
				fi
			done

			# Close base menu
			menu_end $distrib
		fi
	done
}

inspect $image_path
inspect $image_live_path



