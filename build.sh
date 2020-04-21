set -ex
sed -i.ori '1s/^/#include "header.h"\n/' defaulttraits.h

mkdir build
cd build

cmake -Dcharls_BUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=RELEASE ..
make

cp libCharLS.so ${PREFIX}/lib
mkdir -p ${PREFIX}/include/charls
cp ../config.h ../interface.h ../publictypes.h \
     ${PREFIX}/include
