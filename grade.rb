print"enter Grade:"
grade=gets.to_i

if(grade<=0)
	print"enter valid grade"
elsif(grade>0 && grade<6)
	print"elementry"
elsif(grade>5 && grade<9)
	print"middle school"
elsif(grade>8 && grade<=12)
	print"high school"
else
	print"college"
end

