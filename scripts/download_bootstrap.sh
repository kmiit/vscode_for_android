#!/bin/bash

# Ubuntu rootfs, refer to https://github.com/termux/proot-distro/releases
UBUNTU_DISTRO=noble
UBUNTU_ARCH=aarch64
UBUNTU_VERSION=v4.11.0

# bootstrap, refer to https://github.com/termux/termux-packages/releases/
BOOTSTRAP_ARCH=$UBUNTU_ARCH
BOOTSTRAP_TAG=bootstrap-2024.12.08-r1+apt-android-7

BOOTSTRAP_URL=https://github.com/termux/termux-packages/releases/download/${BOOTSTRAP_TAG}/bootstrap-${BOOTSTRAP_ARCH}.zip
PROOT_DISTRO_URL=https://github.com/termux/proot-distro/archive/refs/heads/master.zip
ROOTFS_URL=https://github.com/termux/proot-distro/releases/download/${UBUNTU_VERSION}/ubuntu-${UBUNTU_DISTRO}-${UBUNTU_ARCH}-pd-${UBUNTU_VERSION}.tar.xz
PWD=$(dirname $(readlink -f "$0"))

download_bootstrap() {
    wget $BOOTSTRAP_URL -O ${PWD}/../assets/bootstrap-${BOOTSTRAP_ARCH}.zip
}

download_proot_distro() {
    wget $PROOT_DISTRO_URL -O ${PWD}/../assets/proot-distro.zip
}

download_rootfs() {
    wget $ROOTFS_URL -O ${PWD}/../assets/ubuntu-${UBUNTU_DISTRO}-${UBUNTU_ARCH}-pd-${UBUNTU_VERSION}.tar.xz
}

download_bootstrap
download_rootfs
download_proot_distro