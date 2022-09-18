#!/bin/bash -x
#UC5  Calculating wages for a month

isPartTime=1;
isFullTime=2;
totalsalary=0;
empRatePerHr=20;
numWorkingDays=20;

for (( day=1; day<=$numWorkingDays; day++ ))
do
        empcheck=$((RANDOM%3));
case $empcheck in
        $isFullTime)
                empHr=8
                ;;
        $isPartTime)
                empHr=4
                ;;
        *)
                empHr=0
                ;;

esac

Salary=$(( $empHr*$empRatePerHr ));

totalsalary=$(( $totalsalary*$Salary ));
done
