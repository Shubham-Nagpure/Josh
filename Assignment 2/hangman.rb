@hangman_word_dataset = [["josh", "software", "ubuntu", "linux", "nebula", "grow"], ["reward", "educate", "passion", "trust", "method", "bottle"], ["unstoppable", "yourself", "believe", "innovation", "blogger", "six"] ]

def check_word(user_guess,check_string,blank_arr,guess_word_length)
  flag=false
  check_string_arr=check_string.split("")
  check_string_arr.each_with_index do |string_char, position_char|
    if(string_char==user_guess and blank_arr[position_char]!= string_char)
      blank_arr[position_char]= string_char
      flag=true
      guess_word_length-=1
    end
  end
  return flag, guess_word_length
end


def play
  remaining_chances= 5
  current_stage = 0 
  while current_stage<@hangman_word_dataset.length

    type_word_container = '_'
    check_string = @hangman_word_dataset[current_stage].sample
    blank_arr=Array.new(check_string.length) { "_" }
    guess_word_length=check_string.length

    while(remaining_chances>0 and guess_word_length!=0)

      puts "****** HANGMAN GAME ******"
      puts "Stage: #{current_stage}\tChance: #{remaining_chances}"
      puts "**************************"

      #word blank to help the guess the lenth
      blank_arr.each { |word|
        print word +" "
      }

      puts "\n\nGuess character:"
      user_guess=gets.chomp

      if(type_word_container.include? user_guess)
        flag=true
        puts "You already guess this letter"
      else
        flag,guess_word_length=check_word(user_guess,check_string,blank_arr,guess_word_length)
      end

      if flag!=true
        print "match not foound\n"
        remaining_chances-=1
      end
      type_word_container = user_guess
    end

    if guess_word_length==0
      puts"****************************"						
      puts"\tCongratulation"
      puts"\tClear stage #{current_stage}"
      puts"****************************"
      current_stage+=1
    end

    if(remaining_chances==0)
      puts"\nWord : #{check_string}"
      puts"****************************"						
      puts"\tGAME OVER"
      puts"****************************"	
      exit
    end
  end

  if current_stage==@hangman_word_dataset.length
    puts"****************************"						
    puts"\tCongratulation"
    puts"\tClear All Stage"
    puts"****************************"
  end
end

#Start_Menu
puts "****** HANGMAN GAME ******"
puts "\t1:PLAY"
puts "\t2:EXIT"
puts "**************************"
print "Enter choice:"
choice =  gets.chomp.to_i

if choice == 1
  play
else
  exit
end

