#!/usr/bin/env bash

#files="~/misc_repo/*.sh"
for f in ~/Documents/misc_repo/custom_functions/*.sh
do
    if [[ $f =~ ".sh" ]] && [[ ! $f =~ "sourceFunctions" ]] && [[ ! $f =~ "matlab" ]]; then
        source $f
    fi
done
