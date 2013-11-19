# File: Makefile

ifndef SPARK_BIN
SPARK_BIN=/pkg/s/sparkada/bin
endif
UL=ulimit -s 20000
SPARK=$(UL); $(SPARK_BIN)/spark
TARGET=*.ada
SUB_DIR_TO_RM=asserttrue2

ArraySetFiles=ArraySetUnsigned.ads \
	ArraySetDefs.ads \
	ArraySet.ads \
	ArraySet.adb

default: spark_target

spark_target:
	-$(SPARK) -config_file=Standard.ada -exp $(TARGET)
	-$(SPARK_BIN)/sparksimp
	-$(SPARK_BIN)/pogs
	[ -e esc.sum ] && tail -12 esc.sum

ArraySet:
	$(MAKE) TARGET="$(ArraySetFiles)"

pogs:
	$(SPARK_BIN)/pogs

clean:
	@-for d in `find . -type d -name "??*"`; do \
		echo "rm $$d"; rm $$d/*; rmdir $$d; \
		done
	@-rm \
		*~ \
		*.fdl \
		*.lst \
		*.rep \
		*.rls \
		*.siv \
		*.slg \
		*.sum \
		*.vcg > /dev/null 2>&1;

# End of file
