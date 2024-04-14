#!/usr/bin/env bash

exists=0
touch tempFile.txt

for (( i=0; i<$(cat ~/Documents/misc_repo/custom_functions/last_directory.txt | wc -l); i++ ))
do
    if [[ $(pwd) == $(head -n$(($i+2))  ~/Documents/misc_repo/custom_functions/last_directory.txt | tail -n1) ]]; then
        exists=1
    else
        echo $(head -n$(($i+1))  ~/Documents/misc_repo/custom_functions/last_directory.txt | tail -n1) >> tempFile.txt
    fi

done


if [[ exists == 0 ]]; then
    echo $(pwd) >> ~/Documents/misc_repo/custom_functions/last_directory.txt
else
    cat tempFile.txt > ~/Documents/misc_repo/custom_functions/last_directory.txt
    echo $(pwd) >>  ~/Documents/misc_repo/custom_functions/last_directory.txt
fi

rm tempFile.txt
