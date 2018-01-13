#!/bin/sh

# viper - vi both src/main and src/test versions of persistence.xml

if [ ! -d src/main/resources ]; then
	echo "$0: no src/main/resources here" >&2
	exit 1
fi

mkdir -p src/test/resources/META-INF

vi src/{main,test}/resources/META-INF/persistence.xml
