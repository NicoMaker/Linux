#!/bin/bash

echo "Displaying thr content of $1 ..."
step 2

cat $1
echo

echo "Compressing $1 ..."
step 2
tar -cjvf $1.tar.gz $1