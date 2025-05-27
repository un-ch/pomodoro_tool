#!/bin/bash

DEFAULT_MINUTES=30
NOTIFY_DURATION_SECONDS=60
NOTIFY_TITLE='############## ----- TIME! ----- ##############'
NOTIFY_BODY='Take a break.'
NOTIFY_ICON='dialog-information'

# --- argument parsing ---
if [[ $# -eq 0 ]]; then
	MINUTES=$DEFAULT_MINUTES
elif [[ "$1" =~ ^[0-9]+$ ]]; then
	MINUTES=$1
else
	echo "error: argument must be a positive integer or omitted entirely" 1>&2
	exit 1
fi

# --- calculations ---
SECONDS_TO_WAIT=$((MINUTES * 60))
NOTIFY_DURATION_MS=$((NOTIFY_DURATION_SECONDS * 1000))

# --- countdown ---
echo "Pomodoro started: $MINUTES minutes."
sleep "$SECONDS_TO_WAIT"

# --- notification ---
notify-send \
	-t "$NOTIFY_DURATION_MS" \
	"$NOTIFY_TITLE" \
	"$NOTIFY_BODY" \
	--icon="$NOTIFY_ICON"
