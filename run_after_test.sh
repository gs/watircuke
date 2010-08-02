#!/bin/bash                  
#designed to work with bash 3.2
#this script moves the file into newest created folder in test_results/test_..

#run

#./run_after_test.sh result.html 

result=`cd test_results/ && ls -t1 | head -n1 && cd ..`


if [ "$1" = "--help" ] 
	then
	echo
	echo "This script moves pointed file to the newest folder in test_results/"
	echo "Usage:"
	echo "./run_after_test.sh result.html"
	echo
elif [[ "$1" =~ \.html ]];
	then
	echo
	echo "Moving $1 to test_results/$result"	
	sed -i .html "s/test_results//g" $1
	sed -i .html "s/\/$result\///g" $1
	mv "$1" test_results/"$result"/
	folder=`echo $1|sed s/\.html$//g`
	result2=`echo $result|sed s/test//g`
	echo "Rename the $result to $folder$result2 in test_results folder"
	mv test_results/"$result" test_results/"$folder$result2"
	rm "$1.html"
	echo
else
	echo
	echo "Wrong arguments."
	echo "Try: ./run_after_test.sh --help"
	echo
fi

