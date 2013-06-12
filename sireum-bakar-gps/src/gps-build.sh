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
mkdir $OUTPUT_DIR/$PLUGINS_DIR/kiasan
cp -rf kiasan/simplejson $OUTPUT_DIR/$PLUGINS_DIR/kiasan/simplejson
cp kiasan/__init__.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan/__init__.py
cp kiasan/gpshelper.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan/gpshelper.py
cp kiasan/gui.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan/gui.py
cp kiasan/logic.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan/logic.py
cp kiasan/models.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan/models.py
cp sireum.py $OUTPUT_DIR/$PLUGINS_DIR/sireum.py

cp -rf icons $OUTPUT_DIR/share/gps/icons