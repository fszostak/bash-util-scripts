#!/bin/bash

# fszostak, Wed Aug 22 15:39:17 -03 2018

function ctrl_c() {
	echo "Aborted!!!"
	[ -f $TAR ] && rm $TAR
	exit
}


DIR_LIST=()

# --- check directory list

for D in "$@"
do
	if [ ! -d "$D" ]; then
		echo "Directory \"$D\" not found"
	else
		DIR_LIST+=($D)
	fi
done

# --- file and directories settings

BACKUP_DIR=~/Backup/$(date '+%Y.%m')
[ ! -d $BACKUP_DIR ] && mkdir -p $BACKUP_DIR

DIR=$1
export TAR=$BACKUP_DIR/$(basename "$1").$(date '+%Y%m%d.%H%M%S').tar.gz

trap ctrl_c INT

# --- writing backup file

NUM_DIRS=${#DIR_LIST[@]} 

if [ $NUM_DIRS -gt 0 ]; then
	echo "Writing $TAR (num_dirs=$NUM_DIRS) ..."
	tar czf $TAR --exclude ".git/*" --exclude ".DS_Store" --exclude "node_modules/*" --exclude "build/*" --exclude "cache/*" --exclude "templates_c/*" --exclude "thumbnails/*" --exclude ".quarentine/*" --exclude "*.swp" --exclude "*.bak" ${DIR_LIST[@]}
	if [ $? -ne 0 ]; then
		[ -f $TAR ] && rm $TAR
		echo "error: backup failed"
	else
		echo "success!!!"
	fi
else
	echo "use: backup.sh dir1 [dir2 ...]"
fi

