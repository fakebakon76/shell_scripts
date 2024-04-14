#! /usr/bin/env bash

ifHelp=0;
while getopts ":h" option; do
    case $option in
            h) # display Help
            echo "polo    -->   Brings you to the last directory in the save."
        echo "polo p  -->   Prints the line that each directory is on."
        echo "polo #  -->   Brings you to the directory on #th line of the text file."
            echo "polo t  -->   Opens the text file where the directories are saved."
        ifHelp=1;;
    esac
done

if [[ $ifHelp == 0 ]]; then
    if [[ -z "$1" ]] || [[ $(cat ~/Documents/misc_repo/custom_functions/last_directory.txt | wc -l) == 1 ]]; then #is the first argument null?
        path=$(tail -n1 ~/Documents/misc_repo/custom_functions/last_directory.txt)
        cd $path
    elif [[ $1 == "p" ]]; then #if first arg is p then print
        numLines=$(cat ~/Documents/misc_repo/custom_functions/last_directory.txt | wc -l)
        for (( index=1; index<=$numLines; index++ ))
        do
            line=$(head -n$index  ~/Documents/misc_repo/custom_functions/last_directory.txt | tail -n1)
            echo "$index: $line"
        done
    elif [[ $1 == "t" ]]; then
        nvim ~/Documents/misc_repo/custom_functions/last_directory.txt

    else
        path=$(head -n$1  ~/Documents/misc_repo/custom_functions/last_directory.txt | tail -n1)
        cd $path
    fi
fi
