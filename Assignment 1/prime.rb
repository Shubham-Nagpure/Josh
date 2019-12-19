#check wheather given number is prime or not

print"Enter number:"
check_number=gets.chomp.to_i

for counter in 2..check_number/2
	if(check_number%counter==0)
		break
	end
end

if check_number/2<=div
	print"Given number is prime."
else
	print"Given number is not prime."
end



