#!/bin/bash
echo "Giai phuong trinh bac 1 Ax + B = 0"
echo -n "Nhap a: "
read a
echo -n "Nhap b:"
read b

if [ $a -ne 0 ]; then
	x=$(echo "scale=2;( -$b / $a)"|bc)
	echo "Nghiem la: $x"
	elif [ $b -ne 0 ]; then
		echo "Phuong trinh vo nghiem"
else 
	echo "phuong trin vo so nghiem"
fi

<<comment
echo "cach 2"
if [ $a -eq 0 ];then 
	if [ $b -eq 0 ];then
		echo "PT vo so nghiem !"
	else
		echo "PT vo nghiem"
	fi
else
	x=$(expr -$b / $a)
	echo "PT co nghiem  x = $x"
fi

# cach 3 giai thong qua ham 2 tham so vi tri != ts dong lenh
ptbac1(){
	if [ $a -eq 0 ];then 
	if [ $b -eq 0 ];then
		echo "PT vo so nghiem !"
	else
		echo "PT vo nghiem"
	fi
else
	x=$(expr -$b / $a)
	echo "PT co nghiem  x = $x"
fi
}
#goi ham bang thso vi tri
ptbac1 4 2
#goi ham bang thso dong lenh
ptbac1 $1 $2 
comment

