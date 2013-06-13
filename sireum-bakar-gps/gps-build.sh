#!/bin/bash

OUTPUT_DIR=~/Desktop/gnat-sireum

if test $# -ge "1"
	then
	OUTPUT_DIR=$1
fi

PLUGINS_DIR=share/gps/plug-ins

rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR/$PLUGINS_DIR
cp -rf email $OUTPUT_DIR/$PLUGINS_DIR/email

# v1

mkdir $OUTPUT_DIR/$PLUGINS_DIR/kiasan_v1
cp -rf src/kiasan_v1/simplejson $OUTPUT_DIR/$PLUGINS_DIR/kiasan_v1/simplejson
cp src/kiasan_v1/__init__.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan_v1/__init__.py
cp src/kiasan_v1/gpshelper.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan_v1/gpshelper.py
cp src/kiasan_v1/gui.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan_v1/gui.py
cp src/kiasan_v1/logic.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan_v1/logic.py
cp src/kiasan_v1/models.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan_v1/models.py
cp src/sireum_v1.py $OUTPUT_DIR/$PLUGINS_DIR/sireum_v1.py

cp -rf src/icons $OUTPUT_DIR/share/gps/icons