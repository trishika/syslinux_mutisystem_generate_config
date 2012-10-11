#!/bin/sh

__dl()
{
	mkdir $2
	wget "http://mir1.archlinux.fr/archlinux/iso/archboot/latest/boot/$1" -O $2/$3
}

__dl initramfs_i686.img x86_32 initrd.img
__dl vmlinuz_i686 x86_32 vmlinuz

__dl initramfs_x86_64.img x86_64 initrd.img
__dl vmlinuz_x86_64 x86_64 vmlinuz
