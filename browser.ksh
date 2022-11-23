#!/bin/ksh

# Example of a trivial web browser, that will only work as long as there are http-capable sites
# (would be much harder in https, due to tls requirements).
# Requires Linux /dev/tcp support
# Tested in ksh and (earlier version) in Bash.

host=${1:-darwinsys.com}
page=${2:-index.html}

exec 3<> /dev/tcp/$host/80

echo "GET /index.html HTTP/1.0" >&3
echo "" >&3
while read line <&3; do echo "$line"|tr -d '\r'; done
