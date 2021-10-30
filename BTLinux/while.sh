sum=0
i=0
while [ $i -le 6 ];
do
	sum=$(($sum+$i))
	i=$(( $i+1))
done
echo "Tong  = $sum"


#!/bin/sh
echo “Chuong trinh tinh $1!”
index=0
gt=1
while [ $index -lt $1 ]
do
index=$(($index + 1))
gt=$(($gt * $index))
done
echo “$1!= $gt”

#!/bin/sh
echo “Chuong trinh tinh tong 1-$1”
index=0
tong=0
while [ $index -lt $1 ]
do
index=$(($index + 1))
tong=$(($tong + $index))
done
echo “Tong cac so tu 1-$1= $tong”
exit 0
