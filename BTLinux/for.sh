<<comment
for file in ./*.sh
do
	echo $file
done

for file in ./*.sh
do
	chmod u+r $file
done
ls -l *.sh
comment

huyquyen(){
	if [ $1 -eq 1 ];then
		p="u-r"
	else
		p="u+r"
	fi
	chmod $p ./*.sh
	ls -l *.sh
}
echo "1. Huy quyen"
echo "2. Cap quyen"
echo "3. Thoat"

select i in 1 2 3
do
	if [ $i -eq 1 ];then
		huyquyen $i
	fi
	if [ $i -eq 2 ];then
		huyquyen $i
	fi
	if [ $i -eq 3 ];then
		echo "tam biet"
	fi
done

