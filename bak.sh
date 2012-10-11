#!/bin/bash
rm pxe_bak.tar.bz2

tar cvfj pxe_bak.tar.bz2 README pxelinux.cfg syslinux.cfg vesamenu.c32 pxelinux.0 mkconfig.sh bak.sh image/*/*.sh image_tools/*/dl.sh image_tools/gparted image_tools/memtest

