#!/bin/sh

cd $(dirname $0)
rm -fr openssl-1.1.0h
tar xvf openssl-1.1.0h.tar.gz
cd openssl-1.1.0h
./config --prefix=$1
make -j 16
make install 
