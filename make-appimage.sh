#!/bin/sh

set -eu

GH_SHA="$1"
GH_SHA_SHORT="${GH_SHA:0:8}"

ARCH=$(uname -m)
VERSION="$(cat version|head -n1)"
NAME="melonDS"

PATH_TO_BIN="./extracted/melonDS"

URL_ICON="https://github.com/melonDS-emu/melonDS/raw/refs/heads/master/res/melon.svg"

export ARCH VERSION
export OUTPATH=./dist
# export ADD_HOOKS="self-updater.bg.hook"
# export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON="melonDS.svg"
export DESKTOP="melonDS.desktop"
export OUTPATH=./dist

export DEPLOY_SDL=1
export DEPLOY_OPENGL=1
export DEPLOY_GEGL=0
export DEPLOY_VULKAN=0
export DEPLOY_QT=1
export DEPLOY_PULSE=1
export DEPLOY_PIPEWIRE=0
export DEPLOY_GTK=0
export DEPLOY_GDK=0
export DEPLOY_GLYCIN=0

################################################################################

wget "$URL_ICON" -O "$ICON"

# Deploy dependencies
./quick-sharun.sh "$PATH_TO_BIN"

# Copy the config
cp -va _config AppDir/

# Copy details
mkdir -vp AppDir/_details
cat /etc/os-release > AppDir/_details/system.txt
echo "$GH_SHA" > AppDir/_details/commit.txt
echo "$(date)" > AppDir/_details/date.txt
ldd "$PATH_TO_BIN" > AppDir/_details/ldd.output.txt
dpkg -l > AppDir/_details/packages.txt

cp -va versions/"$VERSION""_URL_""$ARCH"".txt" AppDir/_details/

echo "" > AppDir/_details/sha256sums.txt
sha256sum ./extracted/melonDS >> AppDir/_details/sha256sums.txt
sha256sum archive.zip >> AppDir/_details/sha256sums.txt

# Copy Internal scripts
mkdir -vp AppDir/bin
cp -v is_details AppDir/bin/details
cp -v is_setup.1.sh AppDir/bin/setup
cat is_setup.2.sh >> AppDir/bin/setup
chmod +x AppDir/bin/details
chmod +x AppDir/bin/setup

# Turn AppDir into AppImage
./quick-sharun.sh --make-appimage
