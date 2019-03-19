#!/bin/sh

cd $(dirname $0)
rm -fr libusb-1.0.22
tar xvf libusb-1.0.22.tar.gz
cd libusb-1.0.22

./bootstrap.sh
./configure --prefix=$1 --disable-static --enable-shared
make -j 16
make install

