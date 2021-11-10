#!/bin/bash
set timeout 1
n1=$(shuf -i 1-1000 -n 1)
n2=$(shuf -i 1-2000 -n 1)
ans=$(shuf -i 1-4 -n 1)
if [ "$ans" -eq 1 ]
then
  operation="+"
elif [ "$ans" -eq 2 ]
then
  operation="-"
elif [ "$ans" -eq 3 ]
then
  operation="*"
elif [ "$ans" -eq 4 ]
then
  operation="/"
fi
expect <<END
            spawn ssh 19593@35.167.127.201 ./calculator
            expect "N1:"
            send -- $n1\r
            expect "N2:"
            send -- $n2\r
            expect "Operation(+, -, *, /):"
            send -- $operation\r
            expect eof
END

