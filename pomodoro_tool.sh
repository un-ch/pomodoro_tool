#!/bin/bash

DEFAULT_MINUTES=30
NOTIFY_DURATION_SECONDS=30
NOTIFY_TITLE='############## ----- TIME! ----- ##############'
NOTIFY_ICON='dialog-information'

if [[ $# -eq 0 ]]; then
	MINUTES=$DEFAULT_MINUTES
elif [[ "$1" =~ ^[0-9]+$ ]]; then
	MINUTES=$1
else
	echo "error: argument must be a positive integer or omitted entirely" 1>&2
	exit 1
fi

SECONDS_TO_WAIT=$((MINUTES * 60))
NOTIFY_DURATION_MS=$((NOTIFY_DURATION_SECONDS * 1000))

echo "Pomodoro started: $MINUTES minutes."
sleep "$SECONDS_TO_WAIT"

if [[ -n $(command -v notify-send) ]]; then
	notify-send \
	-t "$NOTIFY_DURATION_MS" "$NOTIFY_TITLE" \
	--icon="$NOTIFY_ICON"

elif [[ -n $(command -v xmessage) ]]; then
	xmessage -center -buttons "" -geometry 300x100 -bg "#282c34" -fg "#abb2bf" \
		"$NOTIFY_TITLE" &

	XMESSAGE_PID=$!

	sleep "$NOTIFY_DURATION_SECONDS"
	kill "$XMESSAGE_PID" 2>/dev/null
else
	echo "$NOTIFY_TITLE"
fi
