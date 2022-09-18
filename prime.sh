#!/bin/bash -x

echo -e "Enter a number : \c"
read num

for (( i=2; i<=$num/2; i++ ))
do
	ans=$(( num%i ))
	if [$ans -eq 0 ]
   then
	echo "$num is not aprime number"
	exit 0
fi
done
	echo "$num is a prime number"	


#range of prime numbers


echo "enter a number upto which you want the prime numbers"
read num
count=0
for (( n=2; n<=$num; n++ ))
do

t=1

if [ $n -lt 2 ]
then echo "Please give other  numbers than 0 and 1"
else
#echo $n
for (( i=2; i<$n; i++ ))
do
        #echo $n
        if (($n%i==0))
        then
        #echo "$n is not prime number"
        t=0
        break;
        fi
done
#echo $t
        if [ $t == 1 ]
        then
        echo "$n is a prime number"
        count=`expr $count + 1`
        fi
fi
done
echo "Total prime numbers upto $num are $count "
