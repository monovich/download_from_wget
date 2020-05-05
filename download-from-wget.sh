#!/bin/bash

#process passed options
WORK_DIR=$(pwd -P)
OUT_DIR="$WORK_DIR/downloads/"

while [[ $# -gt 0 ]]; do
	key="$1"
	case $key in
    -f|--file)
  	FILE="$2"
  	shift
  	;;
    -P|--directory-prefix)
    OUT_DIR="$2"
    shift
    ;;
  	-h|--help)
    echo "Usage: ./download-from-ftp.sh -f <FILE>"
    echo "Options:"
    echo "  -f, --file: path to file"
    exit
    ;;
    *)
    echo "Unknown option: $key, exiting."
    echo "Usage: ./download-from-ftp.sh -f <FILE>"
    exit
    ;;
  esac
  shift
done

#make OUT_DIR
if [[ ! -d $OUT_DIR ]]; then
  mkdir -p $OUT_DIR
fi

#download from file
while read line; do
  wget "$line" -P $OUT_DIR
done < $FILE
