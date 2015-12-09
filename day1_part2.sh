#!/bin/sh

#       AdventOfCode.com
#       Day: 1
#       author:  cr0ky

INPUT=input1.txt
floor=0
count=0

while IFS= read -r -n1 char
do
        ((count++))
        if [[ "$char" == "(" ]] ; then
                ((floor++))
        elif [[ "$char" == ")" ]] ; then
                ((floor--))
        else
                echo "wrong char: $char"
        fi

        if [ "$floor" == "-1" ]; then
                echo $count
                exit 1
        fi


done < "$INPUT"
