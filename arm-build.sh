#!/bin/bash

# Linux build

make distclean || echo clean

rm -f config.status
./autogen.sh || echo done

CFLAGS="-O3 -march=native -Wall -flax-vector-conversions -mcpu=native -mtune=native" ./configure  --with-curl 

make -j2 $nproc

strip -s cpuminer
