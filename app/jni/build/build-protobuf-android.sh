export NDK_ROOT=~/Android/Sdk/ndk/21.2.6472646
export PREFIX=$HOME/Android/protobuf-3.5.1/
export PATH=$HOME/Android/arm-21-toolchain/bin:$PATH
export SYSROOT=$HOME/Android/arm-21-toolchain/sysroot
export CC="arm-linux-androideabi-gcc --sysroot $SYSROOT"
export CXX="arm-linux-androideabi-g++ --sysroot $SYSROOT"
export CXXSTL=$NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9

../configure \
--prefix=$PREFIX \
--host=arm-linux-androideabi \
--with-sysroot="${SYSROOT}" \
--enable-shared \
--enable-cross-compile \
--with-protoc=protoc \
CFLAGS="-march=armv7-a -D__ANDROID_API__=21" \
CXXFLAGS="-frtti -fexceptions -march=armv7-a \
-I${NDK_ROOT}/sources/android/support/include \
-I${NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.9/include \
-I${NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a/include -D__ANDROID_API__=21" \
LDFLAGS="-L${NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a" \
LIBS="-llog -lz -lgnustl_static"

make -j2

make install
