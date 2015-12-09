#!/bin/sh

#       AdventOfCode.com
#       Day: 3
#       author:  cr0ky

INPUT=input3.txt
OUTPUT="0:0"
PREVX="0"
PREVY="0"
PREVXr="0"
PREVYr="0"
flip=1

while IFS= read -r -n1 char
do
        if [[ "$char" == "^" ]] ; then
                #UP
                if [ "$flip" == "1" ]; then
                        ((PREVY++))
                        OUTPUT="$OUTPUT\n$PREVX:$PREVY"
                        flip=0
                else
                        ((PREVYr++))
                        OUTPUT="$OUTPUT\n$PREVXr:$PREVYr"
                        flip=1
                fi
        elif [[ "$char" == "v" ]] ; then
                #DOWN
                if [ "$flip" == "1" ]; then
                        ((PREVY--))
                        OUTPUT="$OUTPUT\n$PREVX:$PREVY"
                        flip=0
                else
                        ((PREVYr--))
                        OUTPUT="$OUTPUT\n$PREVXr:$PREVYr"
                        flip=1
                fi
        elif [[ "$char" == "<" ]] ; then
                #LEFT
                if [ "$flip" == "1" ]; then
                        ((PREVX--))
                        OUTPUT="$OUTPUT\n$PREVX:$PREVY"
                        flip=0
                else
                        ((PREVXr--))
                        OUTPUT="$OUTPUT\n$PREVXr:$PREVYr"
                        flip=1
                fi
        elif [[ "$char" == ">" ]] ; then
                #RIGHT
                if [ "$flip" == "1" ]; then
                        ((PREVX++))
                        OUTPUT="$OUTPUT\n$PREVX:$PREVY"
                        flip=0
                else
                        ((PREVXr++))
                        OUTPUT="$OUTPUT\n$PREVXr:$PREVYr"
                        flip=1
                fi
        else
                echo "wrong char: $char"
        fi



done < "$INPUT"
echo -e $OUTPUT > output3.txt
echo -e "$OUTPUT" | sort | uniq | wc -l
