#!/bin/bash

SRCS=$(cd got && ls *.s);

echo $SRCS;

echo "" > got/run_all.log;
for i in $SRCS; do
	base=$(basename $i .s);
	echo "####################"    >> got/run_all.log;
	echo "## $base" >> run_all.log;
	
	echo -n "$i : assembling...";
	as -o got/$base.o got/$base.s    2>&1  >> got/run_all.log;
	if [ 0 != $? ] ; then
		echo "Failure?";
		continue;
	fi;
	
	echo -n "linking...";
	gcc -o got/$base.exe got/$base.o  2>&1 >> got/run_all.log;
	if [ 0 != $? ] ; then
		echo "Failure?";
		continue;
	fi;
	
	echo -n "running...";
	if [ ! -f got/$base.input ] ; then touch got/$base.input; fi;
	(cat got/$base.input | got/$base.exe > got/$base.output) 2>&1 >> got/run_all.log;
	if [ 0 != $? ] ; then
		echo "Failure?";
		continue;
	fi;
	
	# Should probably check the output here as well. diff?	
	echo "Success?";
done
