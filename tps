#!/bin/sh

# tps - replacement for SQTroff 'ts' (typeset) command
# typeset is now a shell built-in
# ts is now the 'timestamp' command

# common invocation: tps -t -i -T$(DEV) -o$(PAGES) $(MACS)

DEVICE=x11
#ROFF=ditroff
#ROFF=sqtroff
ROFF=groff

USAGE="$0 [-v] old new"

function usage {		# give usage message, and exit
	echo "Usage: ${USAGE}" 2>&1
	exit 1
}

while getopts "im:o:tT:v" opt
do
	case "$opt" in
		i)	;;
		m)	echo "Macro packages not supported yet";;
		o)	PAGERANGE=$OPTARG;;
		t)	;;
		T)	DEVICE=$OPTARG;;
		v)	VERBOSE=true;;
		*)	usage;;
	esac
done
shift `expr $OPTIND - 1`		 # leave just filenames

for file
do
	if $VERBOSE; then
		echo $0: Processing $f
	fi

	$ROFF -T ${DEVICE} ${file}
done

