#!/bin/bash

OUTPUT_DIR=~/Desktop/gnat-sireum

if test $# -ge "1"
	then
	OUTPUT_DIR=$1
fi

PLUGINS_DIR=share/gps/plug-ins

rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR/$PLUGINS_DIR
#cp -rf src/email $OUTPUT_DIR/$PLUGINS_DIR/email

#mkdir $OUTPUT_DIR/$PLUGINS_DIR/kiasan
#cp -rf src/kiasan/simplejson $OUTPUT_DIR/$PLUGINS_DIR/kiasan/simplejson
#cp src/kiasan/__init__.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan/__init__.py
#cp src/kiasan/gpshelper.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan/gpshelper.py
#cp src/kiasan/gui.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan/gui.py
#cp src/kiasan/logic.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan/logic.py
#cp src/kiasan/models.py $OUTPUT_DIR/$PLUGINS_DIR/kiasan/models.py
cp src/sireum.py $OUTPUT_DIR/$PLUGINS_DIR/sireum.py