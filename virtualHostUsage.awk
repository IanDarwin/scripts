#! /usr/bin/awk -f

# Pure-Awk Solution for computing virtual host usage

# Function: calculate total bytes transferred to each 
# virtual host, display results in kilobytes

BEGIN {
    if (ARGC != 2) {
		print "Usage:", ARGV[0], "apache_log_file"
		exit(1)
    }
}

# Do each line
{ byteCount[$1] += $11 }

END {
	for (name in byteCount)
		printf "%-30s %7.2f K\n", name, byteCount[name] / 1024 | "sort"
}

