#!/bin/bash

SRCS=$(cd input && ls *.c);

echo "" > got/run_all.log;
for i in $SRCS; do
	base=$(basename $i .c);
	echo "####################" >> got/run_all.log;
	echo "## $base" >> run_all.log;
	
	echo -n "$i : compiling...";
	make -B got/$base.s 2>&1 >> got/run_all.log;
	if [ 0 != $? ] ; then
		echo "Failure?";
		continue;
	fi;
	
	echo -n "linking...";
	make got/$base.exe 2>&1 >> got/run_all.log;
	if [ 0 != $? ] ; then
		echo "Failure?";
		continue;
	fi;
	
	echo -n "running...";
	make got/$base.output 2>&1 >> got/run_all.log;
	if [ 0 != $? ] ; then
		echo "Failure?";
		continue;
	fi;
	
	echo "Success";
done
