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

dl()
{
	image_path=$1
	for distrib in `ls $image_path`
	do
		if [ -d $image_path/$distrib ]; then
			echo $distrib

			for version in `ls $image_path/$distrib`
			do
				if [ -f $image_path/$distrib/$version ]; then
					echo $version
					cd $image_path/$distrib
					. $version
					cd -
				fi
			done

		fi
	done
}

dl "image"
dl "image_live"

