#!/usr/bin/env bash

if [ "$(id -u)" == "0" ]
then
	printf "%s\n" "Don't run this as root!" >&2
	exit 1
fi

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

check_bash() {
	if [ "$(uname -s)" == "Darwin" ]
	then
		version=${BASH_VERSION%%.*}
		if [ "$version" -eq 3 ]
		then
			printf "%s%s\n" "${0}: This script will not work with the version of" \
			" bash included with macOS. Upgrade your bash version: i.e., use brew."
			exit 1
		fi
	fi
}

#--------------------------

check_bash
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
