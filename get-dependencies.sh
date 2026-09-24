#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    cmake               \
    fooyin              \
    lxqt-qtplugin       \
    kdsingleapplication \
    kvantum             \
    pipewire-audio      \
    pipewire-jack       \
    qcoro               \
    qt6ct               \
    sdl2-compat         \
    taglib

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano ffmpeg-mini libdecor-mini

# Comment this out if you need an AUR package
#make-aur-package libvgm-git
#make-aur-package fooyin
#make-aur-package fooyin-plugin-libvgm-git
#make-aur-package fooyin-plugin-msuinput-git
echo "Building fooyin-plugin-libvgm..."
echo "---------------------------------------------------------------"
REPO="https://github.com/fooyin/fooyin-plugin-libvgm"
VERSION="$(git ls-remote "$REPO" HEAD | cut -c 1-9 | head -1)"
git clone --recursive --depth 1 "$REPO" ./fooyin-plugin-libvgm
echo "$VERSION" > ~/version

cmake -B build-libvgm -S ./fooyin-plugin-libvgm -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
cmake --build build-libvgm -j$(nproc)
cmake --install build-libvgm

echo "Building fooyin-plugin-msuinput..."
echo "---------------------------------------------------------------"
REPO="https://github.com/Vo1dTear/fooyin-plugin-msuinput"
VERSION="$(git ls-remote "$REPO" HEAD | cut -c 1-9 | head -1)"
git clone --depth 1 "$REPO" ./fooyin-plugin-msuinput
echo "$VERSION" > ~/version

cmake -B build-msuinput -S ./fooyin-plugin-msuinput -DCMAKE_BUILD_TYPE=Release
cmake --build build-msuinput -j$(nproc)
cmake --install build-msuinput

