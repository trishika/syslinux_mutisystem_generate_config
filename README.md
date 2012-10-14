
SYSLINUX
========

IMAGE FILE
----------

	* image

This folder contains distribution image file. His folder stuct follow :

tftpboot
└── image
    ├── distrib name
    │    ├── dl.sh
    │    ├── x86_32 | i686
    │    │   ├── vmlinuz    | linux
    │    │   └── initrd.img | initrd.gz
    │    └── x86_64 | amd64
    │        ├── vmlinuz    | linux
    │        └── initrd.img | initrd.gz
    └── ...


Each distrib folder have to contains a dl.sh script that is able to down load back distrib file.
The script "mkconfig.sh" build the syslinux configuration file for these system.

	* image_tools

This is a tool folder, for various stuff that can be used throught syslinux


CONFIGURATION
-------------

The image configuration is generate with mkconfig.sh. The image tools configuration is for now done manually.


OTHER SCRIPT
------------

	* bak.sh

This script do a tar of the main syslinux config/image file.
Distrib image are not backup, only their dl.sh script.


USB KEY
-------

To use this script on an usb you need to install the syslinux mbr to the usb key :

	http://www.syslinux.org/wiki/index.php/HowTos#How_to_Create_a_Bootable_USB:_For_Linux


N.B: There is currently no working way to configure a boot on a "live" image (ie : not only an initrd) from usb key with these scripts.

Copying
=======

Copyright (C) 2012, Aurélien Chabot aurelien@chabot.fr

Licensed under GPLv3
