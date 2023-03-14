#!/bin/bash

KEY="XXXXXXXXXXXXXXXXXXXX"
TITLE="PopClip"
DEVICE="a"
ICON="18"
ICONCOLOR="#FFFF00"
SOUND="21"
VIBRATION="3"
URL=""
URLTITLE=""
PRIORITY="0"
TIME2LIVE=""
RETRY=""
EXPIRE=""
CONFIRM=""
ANSWER="1"
ANSWEROPTIONS=""
ANSWERFORCE="0"

if [ "$POPCLIP_URLS" ]; then
	URLSARRAY=()
	while read -r line; do
		URLSARRAY+=("$line")
	done <<< "$POPCLIP_URLS"
	URL="${URLSARRAY[0]}"
elif [ "$POPCLIP_BROWSER_URL" ]; then
	URL="$POPCLIP_BROWSER_URL"
fi

if [ "$POPCLIP_BROWSER_TITLE" ]; then
	TITLE="$POPCLIP_BROWSER_TITLE"
fi

curl -s \
  -F "k=$KEY" \
  -F "m=$POPCLIP_TEXT" \
  -F "t=$TITLE" \
  -F "d=$DEVICE" \
  -F "i=$ICON" \
  -F "c=$ICONCOLOR" \
  -F "s=$SOUND" \
  -F "v=$VIBRATION" \
  -F "u=$URL" \
  -F "ut=$URLTITLE" \
  -F "pr=$PRIORITY" \
  -F "l=$TIME2LIVE" \
  -F "re=$RETRY" \
  -F "ex=$EXPIRE" \
  -F "cr=$CONFIRM" \
  -F "a=$ANSWER" \
  -F "ao=$ANSWEROPTIONS" \
  -F "af=$ANSWERFORCE" \
  https://www.pushsafer.com/api
