#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION="$(cat version|head -n1)"
URL_ICON="https://github.com/melonDS-emu/melonDS/raw/refs/heads/master/res/melon.svg"

export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON="melonDS.svg"
export DESKTOP="melonDS.desktop"

wget "$URL_ICON" -O "$ICON"

# Deploy dependencies
quick-sharun extracted/melonDS

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
