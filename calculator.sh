echo -n "N1:"
read N1

echo -n "N2:"
read N2

echo -n "Operation(+, -, *, /):"
read Operation

if [ "$Operation" = "+" ]
then
   (( result = N1 + N2 ))
elif [ "$Operation" = "-" ]
then
   if [ "$N1" -ge "$N2" ]
   then
      (( result = N1 - N2 ))
   else
      (( result = N2 - N1 ))
      result="-${result}"
   fi
elif [ "$Operation" = "*" ]
then
   (( result = N1 * N2 ))
elif [ "$Operation" = "/" ]
then
   (( result1 = N1 / N2 ))
   (( result2 = N1 * 100 / N2 ))
   result="${result1}.${result2}"
else
   echo "Error: wrong operation $Operation"
   exit 1
fi

echo $result