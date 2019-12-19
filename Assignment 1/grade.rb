print"Enter Grade:"
grade=gets.to_i

if grade<=0
  p "enter valid grade"
elsif grade>0 and grade<6
  p "elementry"
elsif grade>5 and grade<9
  p "middle school"
elsif grade>8 and grade<=12
  p "high school"
else
  print"college"
end

