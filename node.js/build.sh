#!/bin/sh

cd $(dirname $0)
rm -fr node-v10.6.0
tar xvf node-v10.6.0.tar.gz
cd node-v10.6.0

./configure --prefix=$1
make -j 16
make install

