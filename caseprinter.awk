#!/usr/bin/awk -f

# turn lines like
#	case abc:
#into two lines:
#	case abc:
#		return "abc";

{
	print
	print "\t\treturn \"" $2 "\";"
}
