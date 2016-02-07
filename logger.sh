#!/bin/bash

# Carlos Adrian Gomez
# Logs the current terminal session and cleans up stray typescript.

# Usage: After calling "logger.sh output.txt start",
# enter "exit" at the terminal to finish writing to the output file.
# Then call "logger.sh output.txt clean" to clean up the typescript and
# produce output-processed.txt.

# Todo: Implement "logger.sh output.txt exit" so that the script can
# exit from script(1) and then clean the output file.

displayUsage() {
	echo "Usage: ./logger.sh [output_file].txt [start|clean]"
}

if [ -n "$2" ]
then
	output_file="$1"
	if [ "$2" = "start" ]; then
		script $output_file
	elif [ "$2" = "clean" ]; then
		cat $output_file | perl -pe "'s/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g'" | col -b > $output_file-processed.txt
	else
		displayUsage
	fi
else
	displayUsage
fi

