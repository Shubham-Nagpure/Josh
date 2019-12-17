hangman_word=["josh","software","ubuntu","linux","nebula","hydra"]
chance=5
stage=0

while(stage<hangman_word.length && chance!=0)
	check_str = hangman_word[stage]
	guess_arr=Array.new(check_str.length) { "_" }
	length=check_str.length
	while(chance>0 && length!=0)
	
		flag=false
		puts"\n****** HANGMAN GAME ******"
		print "Stage: #{stage}\tChance: #{chance}"
		print"\n\n"
		guess_arr.each { |c|
		print c +" "
		}

		print"\n\nGuess the word:"
		guess_word=gets.chomp
		
		check_str_arr=check_str.split("")
		check_str_arr.each_with_index do |str_word, pos|
	
			if(str_word==guess_word && guess_arr[pos]!= str_word)
				guess_arr[pos]= str_word
				flag =true
				length-=1
			end
		end
		if(flag!=true)
			puts"match not found"
			chance-=1
		end
		if length==0
			puts"****************************"						
			puts"\tCongratulation"
			puts"\tClear stage #{stage}"
			puts"****************************"
			stage+=1
		end
	end
	if(chance==0)
		puts"****************************"						
		puts"\tGAME OVER"
		puts"****************************"
		stage+=1		
	end
end
if stage==hangman_word.length
	puts"****************************"						
	puts"\tCongratulation"
	puts"\tClear All Stage"
	puts"****************************"
end
