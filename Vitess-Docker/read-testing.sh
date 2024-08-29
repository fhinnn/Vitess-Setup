#!/bin/bash
BEGIN=${1}
END=${2}
x=${BEGIN}
while [ $x -le ${END} ]
do
  echo "select * from posts;"
  echo "select * from tags;"
  echo "select * from categories;"
  x=$(( $x + 1 ))
done