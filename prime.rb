print"Enter number to check it is prime or not"
number=gets.to_i

for a in 2..number/2
	if(number%a==0)
		break
	end
end
if number/2<=a
	print"given number is prime"
else
	print"given number is not prime"
end
