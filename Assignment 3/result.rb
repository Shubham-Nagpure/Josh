class Result
  attr_accessor :mark ,:id, :name

  @@id=0
  @@per_arr=[]

  def initialize(mark,name)
    @mark=mark
    @@id += 1
    @name=name
  end

  def cal_percentage
    total=0
    for i in 0..7 do
      total+=@mark[i]
    end

    percentage=total/8
    @@per_arr.push(percentage)

  end

  def self.highest_percentage
    @@per_arr.max
  end

end

for i in 0..2 do

  mark=Array.new

  print"Enter the #{i+1}.student name:"
  name=gets.chomp
  puts"Enter the marks of 8 weeks"
  for j in 0..7 do
    print"Week#{j+1}:"
    mark[j]=gets.chomp.to_i
  end

  stud=Result.new(mark,'name')

  puts"Student marks of cource:#{stud.cal_percentage}"

end

puts "Maximum percentage:#{Result.highest_percentage}"
