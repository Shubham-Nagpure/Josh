print"Enter number to check it is prime or not"
number=gets.to_i

itr=2
while(number%itr!=0)
	itr+=1
end
if number==itr
	print"given number is prime"
else
	print"given number is npot prime"
end
