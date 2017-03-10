#!/usr/bin/env bash
# Detect whether the terminal has Unicode support. Maybe.
# It works, when it works, by printing a Unicode character, and testing to see
# How "big" it is. If it's more than one character wide, the terminal didn't
# print it as a single character.

# Note that the "simple" solution looking at locale doesn't actually tell us
# anything about the terminal, only the environment.

# Unfortunately this function is not POSIX-compatible, as read lacks -d option.

has_unicode() {
	local BLACK=$(tput setaf 0) # Set color to black, maybe making it invisible
	local NORMAL=$(tput sgr0) # Go back to default, after we print some stuff

	tput sc
	printf "${BLACK}\u2714" # Print a Unicode character
	printf "\033[6n" > /dev/tty # See what column we're in
	IFS='\;' read -s -d\[ garbage
	read -s -d R col
	pos=$(echo $col | cut -d \; -f 2)
	printf "${NORMAL}"
	tput rc

	if [ $pos -eq 2 ]; then
		export UNICODE_AVAILABLE=1
		return 0
	else
		return 1
	fi
}
