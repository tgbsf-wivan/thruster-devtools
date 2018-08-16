#!/bin/sh

cd $(dirname $0)
rm -fr Python-3.7.0
tar xvf Python-3.7.0.tgz
cd Python-3.7.0

./configure --prefix=$1 --enable-shared --with-openssl=$1
make install -j 16
cd ..

ln -s python3 $1/bin/python
ln -s pip3 $1/bin/pip
ln -s python3.7m $1/include/python3.7

python -m pip install PySide2-5.11.0-5.11.0-cp35.cp36-abi3-manylinux1_x86_64.whl

