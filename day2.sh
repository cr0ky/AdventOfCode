#!/bin/sh

#       AdventOfCode.com
#       Day: 2
#       author:  cr0ky

INPUT=input2.txt
totalW=0

while read line
do
        L=`echo $line | cut -d'x' -f1`
        W=`echo $line | cut -d'x' -f2`
        H=`echo $line | cut -d'x' -f3`

        s1=$(($L * $W))
        s2=$(($W * $H))
        s3=$(($H * $L))

        if [[ $s1 -le $s2 && $s1 -le $s3 ]]; then
                slack=$s1
        else
                if [[ $s2 -le $s1 && $s2 -le $s3 ]]; then
                        slack=$s2
                else
                        if [[ $s3 -le $s2 && $s3 -le $s1 ]]; then
                                slack=$s3
                        else
                                echo $line  ERROR
                        fi
                fi
        fi

        totalW=$(($totalW + $((s1*2)) + $((s2*2)) + $((s3*2)) + $slack))

        if [[ $L -le $H && $W -le $H ]]; then
                rib=$(( (($L+$L+$W+$W)) + (($L*$W*$H)) ))
        fi
        if [[ $L -le $W && $H -le $W ]]; then
                rib=$(( (($L+$L+$H+$H)) + (($L*$W*$H)) ))
        fi
        if [[ $H -le $L && $W -le $L ]]; then
                rib=$(( (($H+$H+$W+$W)) + (($L*$W*$H)) ))
        fi

        totalR=$(($totalR + $rib ))

done < "$INPUT"
echo "Wrapping paper: $totalW"
echo "Ribbon: $totalR"
