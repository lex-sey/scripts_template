#!/Bin/bash
export IPSTANDBY=192.168.1.54

ssh root@$IPSTANDBY '
TOTALMEM=$(free -m | grep Mem: | cut -d " " -f 7-15 | sed "s/' '//g");
echo 1 $TOTALMEM

TOTALMEM2=$(free -m | awk "NR==2{print\$2}")
echo 2 $TOTALMEM2
TOTALMEM3= free -m | awk "NR==2 {print \$2}"
echo 3 $TOTALMEM3;
TOTALMEM4=$(free -m | awk NR\==\ 2\{print\ \$2\})
echo 4 $TOTALMEM4
'
