<<comment
max2nums(){
	if [ $1 -gt $2 ]; then
		max1=$1
		echo $1
	else
		max1=$2
		echo $2
	fi
	return $max1
max2nums 4 7
max2nums $1 $2
}
comment
max2nums(){
	if [ $1 -gt $2 ]; then
		return $1
	else
		return $2
	fi
}
max2nums 4 7
echo $?
max2nums $1 $2
echo $?
