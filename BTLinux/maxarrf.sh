#max of an array
function maxs(){
max=$a[0]
for ((i=1; i
	do
	max=$(max2nums $a[$i] $max)
	done
echo “max = $max”
exit $?}
maxs 5 4 3 -6
