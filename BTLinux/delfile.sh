#/bin/bash

<<comment

echo -n "Duong dan tap tin can xoa (if): "
read path
echo $path

if [ -e $path ];then
	echo "Ton tai file ! Ban co chac muon xoa ? (yes/no)"
	read del
	if [ $del = "yes" ];then
		rm $path
		echo "File duoc xoa thanh cong !"
	else
		echo "File chua duoc xoa !"
	fi
else
	echo "Khong ton tai file"
fi
comment

<<comment
echo -n "Duong dan tap tin can xoa (select): "
read path
echo $path

	select i in $path
	do
		if [ -e $i ];then
		echo "Ton tai file ! Ban co chac muon xoa ? (yes/no)"
		read del
			if [ $del = "yes" ];then
				rm $i
				echo "Xoa file $i thanh cong"
			else
				echo "Chua xoa file $i"
			fi
		fi
	done

comment
echo -n "Duong dan tap tin can xoa (for): "
read path
echo $path

	for i in $path
	do
		if [ -e $i ];then
		echo -n "Ton tai file ! Ban co chac muon xoa file $i ? (1/0) : "
		read del
			if [ $del = "1" ];then
				rm $i
				echo "Xoa file $i thanh cong"
			else
				echo "Chua xoa file $i"
			fi
		fi

	done
echo "Cac file chua duoc xoa : "
ls $path
	

