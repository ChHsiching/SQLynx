#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

SQLYNX_SCRIPT="$SCRIPT_DIR/sqlynx-ide.sh"

if [ ! -f "$SQLYNX_SCRIPT" ]; then
	echo "Error: $SQLYNX_SCRIPT not found!"
	exit 1
fi

sudo sh "$SQLYNX_SCRIPT" start

xdg-open "http://127.0.0.1:18888"
