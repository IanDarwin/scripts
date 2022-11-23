#!/bin/sh

# Start the browser. Use exec to eliminate dead shell process

exec java -cp $js/target/classes netweb.Browser0 $*
