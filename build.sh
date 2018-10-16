#!/bin/sh

DEVTOOLS=/devtools/2018.6.24.001

# clang zlib

rm -fr ${DEVTOOLS}
mkdir -p ${DEVTOOLS}

export CXX=clang++
export CC=clang
export PATH=${DEVTOOLS}/bin:${PATH}
export LD_LIBRARY_PATH=${DEVTOOLS}/lib:${LD_LIBRARY_PATH}

sh $(dirname $0)/cmake/build.sh ${DEVTOOLS}
sh $(dirname $0)/openssl/build.sh ${DEVTOOLS}
sh $(dirname $0)/python/build.sh ${DEVTOOLS}
sh $(dirname $0)/boost/build.sh ${DEVTOOLS}
sh $(dirname $0)/node.js/build.sh ${DEVTOOLS}
sh $(dirname $0)/libusb/build.sh ${DEVTOOLS}




 







