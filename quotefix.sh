#!/bin/sh

# test suite for fixquote.awk

echo "You have tried to run the fixquote test program"
echo "This test program cannot be run as a normal sh script."
exit 1

# These should not generate errors
'a'
x='a'
"b"
x="b"
`ls`
x=`ls`

# These should
'
"
`
a'a
a"a
a`a
