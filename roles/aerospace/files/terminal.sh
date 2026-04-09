#!/usr/bin/env bash

set -e

APP="kitty"
TITLE="floating-terminal"
WIN_FILTER='.[] | select(."app-name"=="'"$APP"'" and ."window-title"=="'"$TITLE"'")'

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

aerospace list-monitors --focused --json > "$TMPDIR/monitor" &
aerospace list-windows --all --json > "$TMPDIR/allwin" &
aerospace list-windows --focused --json > "$TMPDIR/focused" &
wait

MONITOR=$(jq -r '.[0]."monitor-name"' "$TMPDIR/monitor")
WIN_ID=$(jq -r "$WIN_FILTER | .\"window-id\"" "$TMPDIR/allwin")
FOCUSED_ID=$(jq -r '.[0]."window-id"' "$TMPDIR/focused")

if [ -z "$WIN_ID" ]; then
  kitty --title="$TITLE" -d "$HOME" --single-instance &

  while [ -z "$WIN_ID" ]; do
    WIN_ID=$(aerospace list-windows --all --json | jq -r "$WIN_FILTER | .\"window-id\"")
    sleep 0.1
  done

  hs -c "placeTerminal($WIN_ID, '$MONITOR')"
  exit 0
fi

if [ "$FOCUSED_ID" = "$WIN_ID" ]; then
  aerospace move-node-to-workspace Z --window-id "$WIN_ID"
  exit 0
fi

ON_FOCUSED=$(aerospace list-windows --workspace focused --json | jq -r "$WIN_FILTER | .\"window-id\"")

if [ -z "$ON_FOCUSED" ]; then
  WORKSPACE=$(aerospace list-workspaces --focused)
  aerospace move-node-to-workspace "$WORKSPACE" --window-id "$WIN_ID"
fi

aerospace focus --window-id "$WIN_ID"
hs -c "placeTerminal($WIN_ID, '$MONITOR')"
