#!/bin/bash
# Utility script to run monkey
#
# From: http://androidcookbook.com/r/1253
# See also: http://developer.android.com/guide/developing/tools/monkey.html

USAGE="$0 [-p package]"

function usage {		# give usage message, and exit
	echo "Usage: ${USAGE}" 2>&1
	exit 1
}

PKG=
while getopts "p:" opt 
do 
	case "$opt" in 
		p)	PKG=$OPTARG;;
		*)	usage;;
	esac
done
shift `expr $OPTIND - 1`		 # leave just filenames

case "${PKG}" in
	"")	usage
		;;
esac

rm tmp/monkey.log
adb -d shell monkey -p ${PKG} --throttle 100 -s 43686 -v 50000 | tee tmp/monkey.log
