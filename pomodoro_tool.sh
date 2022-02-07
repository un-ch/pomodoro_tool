#!/bin/bash

MINUTES_POMODORO_INTERVAL=60
SECONDS_SHOWING_NOTIFYING_BADGE=30

let SECONDS_POMODORO_INTERVAL=$MINUTES_POMODORO_INTERVAL*60
let MILISECONDS_SHOWING_NOTIFYING_BADGE=$SECONDS_SHOWING_NOTIFYING_BADGE*1000
msg='########## TIME! ##########'

sleep $SECONDS_POMODORO_INTERVAL &&
notify-send -t $MILISECONDS_SHOWING_NOTIFYING_BADGE "$msg"
