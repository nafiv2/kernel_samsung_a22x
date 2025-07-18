export CROSS_COMPILE=$(pwd)/toolchain/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-androidkernel-
export CC=$(pwd)/toolchain/clang/host/linux-x86/clang-r383902/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export ANDROID_MAJOR_VERSION=r

export KCFLAGS="-w -fno-stack-protector -D__CLANG__"
export LDFLAGS="-fuse-ld=lld"


# Optional: Enable Ninja if preferred
export KBUILD_NINJA=1

# Build config
make -C $(pwd) O=$(pwd)/out KCFLAGS="-w -fno-stack-protector" CONFIG_SECTION_MISMATCH_WARN_ONLY=y azure_defconfig

# Build kernel
make -C $(pwd) O=$(pwd)/out KCFLAGS="-w -fno-stack-protector" -j16

# Copy kernel image
cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
