#!/usr/bin/awk -f

# Look for quote, followed by only chars that are not quote, to EOL
/^[^']+'[^']+$/	{ print "mismatched single quote on line", FNR }
/^[^"]+"[^"]+$/	{ print "mismatched double quote on line", FNR }
/^[^`]+`[^`]+$/	{ print "mismatched back quote on line", FNR }
