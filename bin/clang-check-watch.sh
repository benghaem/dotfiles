#!/bin/bash
cd $1
cwd=`pwd`
clear
echo "Watching $cwd for changes to .cpp and .h files"
inotifywait -q -m -e close_write,moved_to --format %e/%f . |
while IFS=/ read -r events file; do
    if [ `echo "$file" | egrep .cpp\|.h` ]; then
        echo "--Checking $file-- "
        #must redirect from stderr to stdout
        result=`clang-check $file -- 2>&1`
        echo "$result"
        echo "--Finished $file--"
  fi
done
