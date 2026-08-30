#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q fooyin | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/org.fooyin.fooyin.svg
export DESKTOP=/usr/share/applications/org.fooyin.fooyin.desktop
export USE_HOST_DRIVERS_EXPERIMENTAL=1
export DEPLOY_PIPEWIRE=1

# Deploy dependencies
quick-sharun /usr/bin/fooyin /usr/lib/fooyin/plugins

# Turn AppDir into AppImage
quick-sharun --make-appimage
