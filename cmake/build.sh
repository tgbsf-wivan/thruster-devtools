#!/bin/sh

cd $(dirname $0)
rm -fr cmake-3.12.0
tar xvf cmake-3.12.0.tar.gz
cd cmake-3.12.0

 ./configure --prefix=$1 --parallel=16
 make install -j 16
 
 
 
 


