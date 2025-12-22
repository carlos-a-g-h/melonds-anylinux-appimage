#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION="$(cat version|head -n1)"
URL_MELONDS="$(cat versions/$VERSION_URL_$ARCH.txt|head -n1)"
URL_SHARUN="https://raw.githubusercontent.com/pkgforge-dev/Anylinux-AppImages/refs/heads/main/useful-tools/quick-sharun.sh"

echo "
[ Installing main dependencies... ]
"

apt update
apt install -yy git wget zsync patchelf xvfb unzip binutils build-essential

wget "$URL_SHARUN"
chmod +x quick-sharun.sh

echo "
[ Downloading and fetching dependencies for $VERSION ]
"

find versions|grep "$VERSION"

bash versions/"$VERSION""_PKGS.sh"
wget "$URL_MELONDS" -O archive.zip
unzip archive.zip -d extracted

find

# This is how it should be structured
#
# ./extracted/main-binary
# archive.zip
