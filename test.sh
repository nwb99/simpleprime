#!/bin/bash

check() {
	missing=false
	for i in {0..3}
	do
		if [ ! -s "./prime_O${i}" ]
		then
			printf "%s\n" "${0}: cannot find ./prime_O${i}" >&2
			missing=true
		fi
	done
	
	if [ ! -s "./prime_Ofast" ]
	then
		printf "%s\n" "${0}: cannot find ./prime_Ofast" >&2
		missing=true
	fi
	[ "$missing" == "true" ] && exit 1
}
#--------------------------

check

if [ -s "results.txt" ]
then
	printf "\n%s\n" "----------------" | tee -a results.txt
fi

for i in ./prime_*
do
	printf "%s\n" "$i" | tee -a results.txt
	{ time $i 20000 > /dev/null 2>&1 ; } |& tee -a results.txt
	printf "%s\n" "----------------" | tee -a results.txt
done
