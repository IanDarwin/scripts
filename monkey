#!/bin/bash
# Utility script to run monkey
#
# From: http://androidcookbook.com/r/1253
# See also: http://developer.android.com/guide/developing/tools/monkey.html

rm tmp/monkey.log
adb shell monkey -p package.name.here --throttle 100 -s 43686 -v 50000 | tee tmp/monkey.log
