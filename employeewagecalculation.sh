#!/bin/bash -x
 echo "Welcome to empWageComputation"


	echo "************"


#UC1  Check Employee is present or absent

isPresent=1;
randomcheck=$((RANDOM%2));

if [ $isPresent -eq $randomcheck ];
then
        echo "Employee is present";
else
        echo "employee is absent";
fi

	echo "*************"


#employee absent or present using case satament

isPresent=$((RANDOM%3));
perHourSalary=20;
workingHour=0;
case $isPresent in
        0)
        echo "Employee is absent";
        workingHour=0;
        ;;

        1)
        echo "Employee is present";
        workingHour=8;
        ;;

        2)
        echo "Employee is working as part time";
        workingHour=4;
        ;;
esac
salary=$(($perHourSalary * $workingHour));
echo "Employee has earned $salary $ today";

	echo "*************"


#UC2  Calculating daily wages of  employee

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

	echo "*************"


#UC3  Add part time employee wage

isPartTime=1;
isFullTime=2;
empRatePerHr=20;
randomCheck=$((RANDOM%3));

if [ $isFullTime -eq $randomCheck ];
then
        empHrs=8;
elif [ $isPartTime -eq $randomCheck ];
then
        empHrs=4;
else
        empHrs=0;
fi

salary=$(($empHrs*$empRatePerHr));


	echo "***************"


#UC4   employee parttime or fulltime using case selection 

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

	echo "****************"


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

	echo "*****************"

#UC6 calculating wages till a condition of total working hours or days is reached for a month

perHourSalary=20;
workingHour=0;
totalSalary=0;
totalWorkingHour=0;
day=1;
while [[ $day -le 20 && $totalWorkingHour -lt 40 ]]
do
        isPresent=$((RANDOM%3));
        case $isPresent in
                0)
                #echo "Employee is absent";
                workingHour=0;
                ;;

                1)
                #echo "Employee is present";
                workingHour=8;
                ;;

                2)
                #echo "Employee is working as part time";
                workingHour=4;
                ;;
        esac
        totalWorkingHour=$(($totalWorkingHour + $workingHour));
        if [ $totalWorkingHour -gt 40 ]
        then
                totalWorkingHour=$(($totalWorkingHour - $workingHour));
                break;
        fi
        salary=$(($perHourSalary * $workingHour));
        totalSalary=$(($totalSalary + $salary));
        ((day++));
done
echo "Employee has earned $totalSalary $ in a month (Total working Hour : $totalWorkingHour)";

	echo "*****************"


#UC7 refactor the code to write a function to get work hours

function calculateWorkingHour() {
        case $1 in
                0)
                        workingHour=0;
                        ;;

                1)
                        workingHour=8;
                        ;;
                2)
                        workingHour=4;
                        ;;
        esac;
        echo $workingHour;
}

perHourSalary=20;
totalSalary=0;
totalWorkingHour=0;
day=1;

while [[ $day -le 20 && $totalWorkingHour -lt 40 ]]
do
        wHour=$(calculateWorkingHour $((RANDOM%3)));
        totalWorkingHour=$(($totalWorkingHour + $wHour));
        if [ $totalWorkingHour -gt 40 ]
        then
                totalWorkingHour=$(($totalWorkingHour - $wHour));
                break;
        fi
        salary=$(($perHourSalary * $wHour));
        totalSalary=$(($totalSalary + $salary));
        ((day++));
done
echo "Employee has earned $totalSalary $ in a month (Total working Hour : $totalWorkingHour)";



	echo "****************"

#UC8 store the daily wage along with the total wage

#CONSTANTS FOR THE PROGRAM
IS_PART_TIME=1;
IS_FULL_TIME=2;
MAX_HRS_IN_MONTH=4;
EMP_RATE_PER_HR=20;
NUM_WORKING_DAYS=20;

#VARIABLES
totalEmpHr=0;
totalWorkingDays=0;

function getWorkHrs() {

        case $empCheck in
        $IS_FULL_TIME)
                empHrs=8
                        ;;
        $IS_PART_TIME)
                empHrs=4
                        ;;
        *)
                empHrs=0
                        ;;
esac
echo $empHrs
}

while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]

do

        ((totalWorkingDays++))
        empCheck=$((RANDOM%3));
        empHrs="$(getWorkHrs $empCheck)"
        totalEmpHrs=$(($totalEmpHrs+$empHrs))
        dailyWage[ $totalWorkingDays ]=$(($empHrs*$EMP_RATE_PER_HR))
done

totalSalary=$(($totalEmpHrs*EMP_RATE_PER_HR ));
echo ${dailyWage[@]}


	echo "****************"

#UC9 store the day and the daily wage along with the total wage
#!/bin/bash -x
#CONSTANTS FOR THE PROGRAM
IS_PART_TIME=1;
IS_FULL_TIME=2;
MAX_HRS_IN_MONTH=4;
EMP_RATE_PER_HR=20;
NUM_WORKING_DAYS=20;

#VARIABLES
totalEmpHr=0;
totalWorkingDays=0;

	declare -A dailyWage;

function getWorkHrs() {

        case $empCheck in
        $IS_FULL_TIME)
                empHrs=8
                        ;;
        $IS_PART_TIME)
                empHrs=4
                        ;;
        *)
                empHrs=0
                        ;;
esac
echo $empHrs
}

function getEmpWage () {
        local empHr=$1
        echo $(( $empHr*$EMP_RATE_PER_HR ))
}

while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]

do

        ((totalWorkingDays++))
        empCheck=$((RANDOM%3));
        empHrs="$( getWorkHrs $empCheck )"
        totalEmpHrs=$(( $totalEmpHrs+$empHrs ))
        dailyWage["$totalWorkingDays"]="$(getEmpWage $empHrs)"
done

totalSalary=$(($totalEmpHrs*EMP_RATE_PER_HR ));
echo ${dailyWage[@]}

