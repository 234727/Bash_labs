#! /bin/bash

if [ -d "A1" ]; then
  rm -rf A1
fi

mkdir A1
mkdir A1/A2
mkdir A1/A2/A3

dir1="A1/P"
dir2="A1/A2/P"
text=".txt"
text2=".bin"

for var in `seq 1 9`; do
  touch $dir1$var$text
done

for var in `seq 10 19`; do
  touch $dir2$var$text2
done

# a)
find ./A1 -type f -name "*.txt" | sort | tail -5

# b)
find ./A1 -size -5k -and -size +1k -exec readlink -f {} \; | tr '/' '\\'

#  c)
find ./A1 -maxdepth 2 \( -name "*.jpg" -or -name "*.png" \) | du -k --summarize
