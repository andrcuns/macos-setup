#!/usr/bin/env bash

set -e

function place_terminal() {
  hs -c "placeTerminal($1)"
}

APP="kitty"
TITLE="floating-terminal"

WIN_FILTER=".[] | select(.\"app-name\"==\"$APP\" and .\"window-title\"==\"$TITLE\")"
WIN=$(aerospace list-windows --all --json | jq -r "$WIN_FILTER" || true)

if [ -z "$WIN" ]; then
  kitty --title="$TITLE" &

  while [ -z "$WIN_ID" ]; do
    WIN_ID="$(aerospace list-windows --all --json | jq -r "$WIN_FILTER | .\"window-id\"")"
    sleep 0.2
  done
  
  place_terminal "$WIN_ID"
  exit 0
fi

WIN_ID=$(echo "$WIN" | jq -r '."window-id"')
FOCUSED=$(aerospace list-windows --json --focused | jq -r '.[] | ."window-id"')

if [ "$FOCUSED" = "$WIN_ID" ]; then
  aerospace move-node-to-workspace Z --window-id "$WIN_ID"
  exit 0
elif [ -z "$(aerospace list-windows --json --workspace focused | jq -r "$WIN_FILTER | .\"window-id\"")" ]; then
  WORKSPACE=$(aerospace list-workspaces --focused)
  aerospace move-node-to-workspace "$WORKSPACE" --window-id "$WIN_ID"
fi

aerospace focus --window-id "$WIN_ID"
place_terminal "$WIN_ID"

