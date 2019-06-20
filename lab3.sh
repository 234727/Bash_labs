#! /bin/bash

if [ -d "A" ]; then
  rm -rf A
fi

mkdir A
mkdir A/B
mkdir A/B/C
mkdir A/D
mkdir A/D/E
mkdir A/D/E/F

touch A/B/C/P1
touch A/B/C/P2
touch A/B/P3
touch A/D/E/F/P4
touch A/D/E/F/P5

ln -s ../../B/C/P1 A/D/E/link_P1
ln -s `realpath A/B/C/P2` A/D/E/link_P2_bez
ln -s F/P4 A/D/E/link_P4

ln -s ../D/E/F/P4 A/B/link_P4
ln -s `realpath A/D/E/F/P5` A/B/link_P5_bez
ln -s P3 A/B/link_P3

rm -rf "`readlink -f A/B/link_P4`"
