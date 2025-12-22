#!/bin/bash

# NOTE: THIS IS AN INTERNAL SCRIPT AND IT CAN ONLY RUN INSIDE THE APPIMAGE AS
# A COMMAND LINE ARGUMENT

set -eu

MAIN_BIN="/usr/bin/melonDS"

CONFIG_DIR="$HOME""/.config/melonDS"

DESKTOP="melonDS.desktop"
DESKTOP_EXEC=$(basename "$MAIN_BIN")
PATH_ICON="/usr/share/icons/melonDS.png"
declare -a LBINARIES=(
	"$MAIN_BIN"
)

function additional_config_tasks() {
	# echo "run aditional stuff here"
	sed -i "s:HOME_DIRECTORY:$HOME:" "$CONFIG_DIR"/melonDS.ini
}
