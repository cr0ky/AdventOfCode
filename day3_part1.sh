#!/bin/sh

#       AdventOfCode.com
#       Day: 3
#       author:  cr0ky

INPUT=input3.txt
OUTPUT="0:0"
PREVX="0"
PREVY="0"

while IFS= read -r -n1 char
do
        if [[ "$char" == "^" ]] ; then
                #UP
                ((PREVY++))
                OUTPUT="$OUTPUT\n$PREVX:$PREVY"
        elif [[ "$char" == "v" ]] ; then
                #DOWN
                ((PREVY--))
                OUTPUT="$OUTPUT\n$PREVX:$PREVY"
        elif [[ "$char" == "<" ]] ; then
                #LEFT
                ((PREVX--))
                OUTPUT="$OUTPUT\n$PREVX:$PREVY"
        elif [[ "$char" == ">" ]] ; then
                #RIGHT
                ((PREVX++))
                OUTPUT="$OUTPUT\n$PREVX:$PREVY"
        else
                echo "wrong char: $char"
        fi

done < "$INPUT"
echo -e "$OUTPUT" | sort | uniq | wc -l
