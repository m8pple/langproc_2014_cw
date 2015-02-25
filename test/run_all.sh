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
	
	# Meh, there are never any problems when linking
	# echo -n "linking...";
	# gcc -o got/$base.exe got/$base.o  2>&1 >> got/run_all.log;
	
	
	# Hrmm, I could actually run the program here, and check whether that
	# succeeded.
	
	# Should probably check the output here as well. diff?	
	echo "Success?";
	
	# It seems like commit c9fa1092f4671103cd9d05299941d91cba9d7df9 had a better version of this
done
