#!/bin/bash
# Utility script to run monkey
#
# From: http://androidcookbook.com/r/1253
# See also: http://developer.android.com/guide/developing/tools/monkey.html

USAGE="$0 [-d|-e][-r|-s seed][-t throttle][-p package]"

SEED=43686 
THROTTLE=100 # msec
if [ -f AndroidManifest.xml ]; then
	PKG=$(grep 'package=' AndroidManifest.xml | awk -F\" '{print $2}')
fi

function usage {		# give usage message, and exit
	echo "Usage: ${USAGE}" 2>&1
	exit 1
}

while getopts "dep:rs:t:" opt 
do 
	case "$opt" in 
		d)	DEV="-d";;
		e)	DEV="-e";;
		p)	PKG=$OPTARG;;
		r)	SEED=$RANDOM;;
		s)	SEED=$OPTARG;;
		t)	THROTTLE=$OPTARG;;
		*)	usage;;
	esac
done
shift `expr $OPTIND - 1`		 # leave just filenames

case "${PKG}" in
	"")	usage
		;;
esac

rm tmp/monkey.log
adb ${DEV} shell monkey -p ${PKG} --throttle ${THROTTLE} -s $SEED -v 50000 | tee tmp/monkey.log
