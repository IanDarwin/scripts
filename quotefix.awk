#!/usr/bin/awk -f

# look for quotes that are mismatched on the same line.

# Look for quote, followed by only chars that are not quote, to EOL
/^[^']+'[^']+$/	{ print "mismatched single quote on line", FNR }
/^[^"]+"[^"]+$/	{ print "mismatched double quote on line", FNR }
/^[^`]+`[^`]+$/	{ print "mismatched back quote on line", FNR }
