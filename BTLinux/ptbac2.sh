#!/bin/bash
echo "Giai phuong trinh bac 2"
echo -n "Nhap A : "
read a
echo -n "Nhap B : "
read b
echo -n "Nhap C: "
read c
delta=$(($b * $b - 4*$a * $c))

if [ $a -eq 0 ]; then 
	echo "Do he so A = 0 -> Tro thanh pt bac 1 co dang Bx + C = 0"
	if [ $b -ne 0 ]; then
	x=$(echo "scale=2;( -$c / $b)"|bc)
	echo "Phuong trinh co nghiem la: x = $x"
	elif [ $b -ne 0 ]; then
		echo "Phuong trinh vo nghiem"
	else 
		echo "Phuong trin vo so nghiem"
	fi
else
  if [ $delta -lt 0 ]; then
	echo  "Phuong trinh vo nghiem"
	elif [ $delta -eq 0 ]; then
		echo  "Nghiem kep: "
		x=$(echo "scale=2; (-$b /( 2 * $a))"|bc)
		echo "$x"
  else
	echo  "Phuong trinh co 2 nghiem phan biet "
		x1=$(echo "scale=2; -($b +sqrt($delta))/(2*$a)" | bc)
	echo "x1 = $x1"
		x2=$(echo "scale=2; -($b - sqrt($delta))/(2*$a)" | bc)
	echo "x2 = $x2"
  fi
fi
