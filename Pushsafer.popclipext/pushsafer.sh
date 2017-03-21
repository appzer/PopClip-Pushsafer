#!/bin/bash

KEY="XXXXXXXXXXXXXXXXXXXX"
TITLE="PopClip"
DEVICE="a"
ICON="18"
SOUND="21"
VIBRATION="3"
URL=""
URLTITLE=""

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
  -F "s=$SOUND" \
  -F "v=$VIBRATION" \
  -F "u=$URL" \
  -F "ut=$URLTITLE" \
  https://www.pushsafer.com/api