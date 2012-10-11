#!/bin/bash

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
					./$version
					cd -
				fi
			done

		fi
	done
}

dl "image"
dl "image_live"

