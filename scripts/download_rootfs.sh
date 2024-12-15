#!/bin/bash
# Ubuntu rootfs, refer to https://github.com/termux/proot-distro/releases
DISTRO_TYPE=archlinux
DISTRO_VARIANT=
DISTRO_ARCH=aarch64
DISTRO_VERSION=v4.6.0

if [[ ${DISTRO_TYPE} != "" ]]; then
    DISTRO_VARIANT=-${DISTRO_VARIANT}
fi

# bootstrap, refer to https://github.com/termux/termux-packages/releases/
PROOT_DISTRO_URL=https://github.com/termux/proot-distro/archive/refs/heads/master.zip
ROOTFS_URL=https://github.com/termux/proot-distro/releases/download/${DISTRO_VERSION}/${DISTRO_TYPE}${DISTRO_VARIANT}-${DISTRO_ARCH}-pd-${DISTRO_VERSION}.tar.xz
PWD=$(dirname $(readlink -f "$0"))

download_proot_distro() {
    wget $PROOT_DISTRO_URL -O ${PWD}/../assets/proot-distro.zip
}
download_rootfs() {
    wget $ROOTFS_URL -O ${PWD}/../assets/${DISTRO_ARCH}${DISTRO_VARIANT}-${DISTRO_ARCH}-pd-${DISTRO_VERSION}.tar.xz
}

download_rootfs
download_proot_distro