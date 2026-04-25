#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    libdecor            \
    lxqt-qtplugin       \
    kdsingleapplication \
    kvantum             \
    pipewire-audio      \
    pipewire-jack       \
    qcoro               \
    qt6ct               \
    sdl2                \
    taglib

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano ffmpeg-mini

# Comment this out if you need an AUR package
make-aur-package libvgm-git
make-aur-package fooyin

# If the application needs to be manually built that has to be done down here

# if you also have to make nightly releases check for DEVEL_RELEASE = 1
#
# if [ "${DEVEL_RELEASE-}" = 1 ]; then
# 	nightly build steps
# else
# 	regular build steps
# fi
