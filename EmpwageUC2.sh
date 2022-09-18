#!/bin/bash -x
#UC2  Calculate daily employee wage

isPresent=1;
randomcheck=$((RANDOM%2));

if [ $isPresent -eq $randomcheck ];
then
        empRatePerHr=20;
        empHrs=8;
        salary=$(( $empHrs*$empRatePerHr));
else
        salary=0;
fi
