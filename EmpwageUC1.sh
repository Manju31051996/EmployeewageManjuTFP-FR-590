#!/bin/bash -x

 echo "Welcome to empWageComputation"


	echo "***************"


#UC1  Check Employee is present or absent
isPresent=1;
randomcheck=$((RANDOM%2));

if [ $isPresent -eq $randomcheck ];
then
        echo "Employee is present";
else
        echo "employee is absent";
fi

