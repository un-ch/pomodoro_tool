#!/bin/bash

FIRST_COMMAND_LINE_ARGUMENT="$1"

if [ "$#" -ne 0 ]; then	
	MINUTES_POMODORO_INTERVAL=$FIRST_COMMAND_LINE_ARGUMENT
else
	MINUTES_POMODORO_INTERVAL=1
fi

SECONDS_SHOWING_NOTIFYING_BADGE=30
msg='############## _____ TIME! _____ ##############'

let SECONDS_POMODORO_INTERVAL=$MINUTES_POMODORO_INTERVAL*2
let MILISECONDS_SHOWING_NOTIFYING_BADGE=$SECONDS_SHOWING_NOTIFYING_BADGE*1000

# notify-send -t $MILISECONDS_SHOWING_NOTIFYING_BADGE "$msg"

sleep $SECONDS_POMODORO_INTERVAL && exec /home/us/prj/timer/build/timer

# exec /home/us/prj/foowm/build/foowm
#notify-send \
#    -t $MILISECONDS_SHOWING_NOTIFYING_BADGE \
#    '############## _____ TIME! _____ ##############' \
#    'This is an example notification.' --icon=dialog-information
