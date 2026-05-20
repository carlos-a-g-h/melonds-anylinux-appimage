#!/usr/bin/bash

set -eux

apt install -yy \
libx11-6 libegl1 libqt6multimedia6 libenet7 libsdl2-2.0-0 libarchive13t64 zstd libfaad2 libqt6network6t64 libqt6widgets6t64 libqt6gui6t64 libqt6core6t64 libxcb1 libglvnd0 libasound2t64 libpulse0 libsamplerate0 \
pulseaudio pipewire
