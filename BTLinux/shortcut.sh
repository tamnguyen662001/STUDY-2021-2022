#/bin/bash

echo -n "Ban ten gi "
read name
echo "chao $name"
echo "thu muc nguoi dung cua ban la : $HOME"
echo "thu muc hien hanh la $PWD"
echo -n "Duong dan tap tin can tao shortcut : "
read path
echo $path

if [ -e $path ];then
	ln -s $path /home/tamnguyen/Desktop
	echo "Tao shortcut thanh cong"
else
	echo "Khong ton tai file"
fi

