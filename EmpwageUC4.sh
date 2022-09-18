#!/bin/bash -x
#UC4 employee parttime or fulltime solving  using case statement

isPartTime=1;
isFullTime=2;
empRatePerHr=20;
empCheck=$((RANDOM%3));

case $empCheck in
        $isFullTime)
                empHrs=8
                ;;
        $isPartTime)
                empHrs=4
                ;;
        *)
                empHrs=0
                ;;
esac
Salary=$(( $empHrs*$empRatePerHr ));
