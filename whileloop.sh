#!/bin/bash

# Input from user
echo "Enter the number -"
read n

i=1
while [ $i -le 10 ]
do
res=`expr $i \* $n`

# printing on console
echo "$n * $i = $res"
   ((++i))
done

#magic number
echo -en "Please guess the magic number: "
read X
echo $X | grep "[^0-9]" > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
  echo "Sorry, wanted a number"
else

  if [ "$X" -eq "7" ]; then
    echo "You entered the magic number!"
  fi
fi
