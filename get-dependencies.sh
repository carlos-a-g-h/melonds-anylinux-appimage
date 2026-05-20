#!/bin/sh

# TODO: FINISH THIS LATER, DO NOT TEST OR RUN

set -eux

# System architecture
ARCH=$(uname -m)

# [MelonDS] Select version
VERSION="$(sed -n 1p sources.txt)"
THE_FILE="$VERSION""_URL_""$ARCH"".txt"

# [MelonDS] Upstream release
URL_UPSTREAM=$(awk "/https/ && /github.com/ && /melonDS/ && /releases/ && /$VERSION/ && /$ARCH/" sources.txt)

# [Anylinux] Quick sharun script
URL_SHARUN=$(awk "/https/ && /quick-sharun.sh/" sources.txt)

# Installing basic dependencies
apt update
apt install -yy git wget strace zsync patchelf xvfb unzip binutils build-essential squashfs-tools

# Downloading Quick Sharun script
wget "$URL_SHARUN"
chmod +x quick-sharun.sh

# Installing extra dependencies based on the version
bash versions/"$VERSION""_PKGS.sh"

# Download the official release from upstream
wget "$URL_UPSTREAM" -O archive.zip
unzip archive.zip -d extracted

# Print the contents of the current working directory
echo "
[ CONTENTS ]
"
find

# This is how it should be structured
#
# ./extracted/main-binary
# archive.zip
