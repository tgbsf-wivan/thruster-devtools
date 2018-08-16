#!/bin/sh

cd $(dirname $0)
rm -fr boost_1_65_1
unzip boost_1_65_1.zip
cd boost_1_65_1

cp -fv ../visualc.hpp boost/config/compiler/visualc.hpp
cp -fv ../builtin_converters.cpp libs/python/src/converter/builtin_converters.cpp

sh bootstrap.sh --prefix=$1 --with-toolset=clang --with-python=$1/bin/python
./b2 install address-model=64 variant=release link=shared threading=multi -j 16

cd ..
rm -fr beast-124
unzip beast-124.zip
cd beast-124
mv -fv include/boost/beast $1/include/boost
mv -fv include/boost/beast.hpp $1/include/boost
