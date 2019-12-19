class Details	#Class name as Demo

	attr_reader :emp_no		#Attribute reader is used to get value of variable,this is use instead of getter method coz in getter method we have to write to many line of code.
	attr_writer :total_days			#Attribute writer is used to set value to variable, this is again use instead of setter method
	attr_accessor :stud_name	#attribute used to get and set value to variable.

	@@emp_no=0 

	#This is counstructor 
	def initialize(emp_name)
		@@emp_no+=1
		@emp_name=emp_name
	end

	private #this is access specifier.becouse of private access specifier this is only used within class
	def cal_salary()
		salary=@total_days*500
	end

	public #this is access specifier.It allows to access outside the class.
	def emp_details()
		puts"Employee details"
		puts"emp_no:#{@@emp_no}\temp_name:#{@emp_name}\tsalary:#{cal_salary}"
	end

end

emp=Details.new("shubh") #creating object of class 
emp.total_days=24
emp.emp_details #calling instance method 
