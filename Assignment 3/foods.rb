class Resto

  attr_accessor :choice

  @@choice_arr=[]
  @@order_number=0
  @@menu_avail={"vada pav"=>12,"Dosa"=>11,"roll"=>20,"biryni"=>2}

  def initialize()
    @@order_number+=1
  end

  public

  def self.menu()
    puts"********MENU*********"
    puts"1:vada pav"
    puts"2.Dosa"
    puts"3.Roll"
    puts"4.Biryani"
  end

  def user_choice(choice)
    if @@menu_avail["#{choice}"]>0
        @@menu_avail["#{choice}"]-=1
        puts "order is placed"
        sleep(3)
        puts "order is confirm"

      else
        puts"please enter correct option"
      end
  end
end
while(1)
  Resto.menu
  print"enter your choice:"
  choice=gets.chomp

  res=Resto.new()
  res.user_choice(choice)
end

