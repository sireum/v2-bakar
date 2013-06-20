# settings

export SIREUM_HOME=/Users/jj/Sireum
export BAKAR_GPS=/Users/jj/santos/bakargps
export SIREUM_REPO=/Volumes/HD/apps-dev.sireum.org
export SIREUM_UPDATE=/Users/jj/santos/update
export WORKSPACE=/Users/jj/workspace
export PATH=$PATH:$SIREUM_HOME/apps/z3/bin


# create BakarGpsV1 plugin package

# build BakarGpsV1 plugin
cd $WORKSPACE/sireum-bakar/sireum-bakar-gps
rm -rf $BAKAR_GPS/Gnat
mkdir $BAKAR_GPS/Gnat
sudo ./gps-v1-build.sh $BAKAR_GPS/Gnat/2014

cd $BAKAR_GPS

rm -rf bakargpsv1

mkdir bakargpsv1

cd bakargpsv1

sireum t s bakargpsv1.sapp ../gnat

mkdir $SIREUM_REPO/BakarGpsV1

cp -f bakargpsv1.sapp $SIREUM_REPO/BakarGpsV1/bakargpsv1.sapp


# create BakarGps plugin package

# build BakarGps plugin
cd $WORKSPACE/sireum-bakar/sireum-bakar-gps
rm -rf $BAKAR_GPS/Gnat
mkdir $BAKAR_GPS/Gnat
sudo ./gps-build.sh $BAKAR_GPS/Gnat/2014

cd $BAKAR_GPS

rm -rf bakargps

mkdir bakargps

cd bakargps

sireum t s bakargps.sapp ../gnat

mkdir $SIREUM_REPO/BakarGps

cp -f bakargps.sapp $SIREUM_REPO/BakarGps/bakargps.sapp


# prepare workspace

cd $WORKSPACE/sireum-core-internal/sireumv2/codebase

ln -s $WORKSPACE/sireum-bakar bakar
ln -s $WORKSPACE/sireum-core core
ln -s $WORKSPACE/sireum-core.prelude prelude


# build

rm -rf $SIREUM_UPDATE/*

cd $WORKSPACE/sireum-core-internal/sireumv2

#tools/bin/sbt-init

sudo tools/bin/sbt clean test package-bin package-src "update-dist $SIREUM_UPDATE $SIREUM_REPO"
