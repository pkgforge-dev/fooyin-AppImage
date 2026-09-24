#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
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
