#!/bin/bash

# fszostak, Wed Aug 22 15:38:33 -03 2018

function ctrl_c() {
	echo "Aborted!!!"
	[ -f $TAR ] && rm $TAR
	exit
}

# setup: brew install jpegoptim pngquant 

O_JPG=jpegoptim
O_PNG=pngquant

IMAGES="$1"
if [ ! -d "$IMAGES" ]; then
	echo "error: optimize.sh <dir>"
	exit
fi

trap ctrl_c INT


# --- optimizing JPEG image files

while read FILE; do
	OPT_FILE="${FILE}.opt"

	[ ! -f "$FILE" ] && continue

	ORIG_FSIZE=$(stat -f%z "$FILE")

	$O_JPG --all-progressive --stdout -m85 "$FILE" > "$OPT_FILE"

	if [ $? -ne 0 ]; then
		[ -f "$OPT_FILE" ] && rm "$OPT_FILE"
		echo "error: jpegoptim failed for $FILE"
	else
		FSIZE=$(stat -f%z "$OPT_FILE")

		if [ $FSIZE -gt 0 ]; then
			mv "$OPT_FILE" "$FILE"
		else
			rm "$OPT_FILE"
		fi
	fi

	echo
done <<EOF
$(find "$IMAGES" -name "*.jp*g" -type f 2> /dev/null)
EOF


# --- optimizing PNG image files

while read FILE; do
	OPT_FILE="${FILE}.opt"
	[ ! -f "$FILE" ] && continue

	ORIG_FSIZE=$(stat -f%z "$FILE")

	$O_PNG --quality=70-95 - < "$FILE" > "$OPT_FILE"

	if [ $? -ne 0 ]; then
		[ -f "$OPT_FILE" ] && rm "$OPT_FILE"
		echo "error: pngquant failed for $FILE"
	else
		FSIZE=$(stat -f%z "$OPT_FILE")

		if [ $FSIZE -gt 0 ]; then
			mv "$OPT_FILE" "$FILE"
			echo "$FILE ($ORIG_FSIZE -> $FSIZE)"
		else
			rm "$OPT_FILE"
		fi
	fi

	echo
done <<EOF
$(find "$IMAGES" -name "*.png" -type f 2> /dev/null)
EOF
