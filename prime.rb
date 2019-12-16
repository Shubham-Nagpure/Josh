print"Enter number to check it is prime or not"
number=gets.to_i

itr=2
for a in 2..number/2
	if(number%itr!=0)
		break
	end
end
if number/2<=itr
	print"given number is prime"
else
	print"given number is not prime"
end
