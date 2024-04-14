#!/bin/env bash

err=0
if [[ $# -gt 0 ]]; then
        if [[ $1 == "-v" ]]; then
                if [[ $# -eq 2 ]]; then
                        gcc $2
                        err=$?

                        if [[ $err == 0 ]]; then
                                valgrind ./a.out
                        else
                                echo -e "\n---- THERE WAS A COMPILATION ERROR ----"
                        fi
                else
                        valgrind ./a.out
                fi
                return
        fi
        gcc $1
        err=$?
fi

if [[ $err -eq 0 ]]; then
        ./a.out
else
        echo -e "\n---- THERE WAS A COMPILATION ERROR ----"
fi
