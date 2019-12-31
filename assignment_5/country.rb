module WinWar
  def can_win_war? gdp, army_strength
    gdp >= 5 && army_strength >= 2
  end
end

module CountryLoan
  def loan_from_IMF? population, gdp, states, state_of_country
    puts population
    puts gdp

    gdp >= 6 && states >= 15 && state_of_country == :developing
  end

  def loan_from_world_bank? population, gdp
    population >= 10 && gdp >= 5
  end  
end

module UNMebership
  def get_seat_in_UN? population, gdp, state_of_country
    population >= 10 && gdp >= 4
  end  
end

COUNTRY_DATABASE = Hash.new

class Country

  include WinWar
  include UNMebership
  include CountryLoan

  attr_accessor :country_name, :population, :GDP, :number_of_states, :army_strengh, :country_state

  def registerCountry country_name, country_population, gdp, no_of_state, country_army_strength,state_of_country
    country_data = {"NameOfCountry" => country_name,"gdp"=>gdp, "Population"=> country_population, "numberOfState" => no_of_state,"ArmyStrength" => country_army_strength, "stateOfCountry" => state_of_country}
    COUNTRY_DATABASE["#{country_name}"] = country_data 
    displayCountryInfo(country_name)
  end

  def displayCountryInfo(country_name)
    if COUNTRY_DATABASE.has_key?(country_name)
      puts "Country Details"
      puts "Name : #{COUNTRY_DATABASE[country_name]['NameOfCountry']}"
      puts "GDP : #{COUNTRY_DATABASE[country_name]['gdp']}"
      puts "Population :  #{COUNTRY_DATABASE[country_name]['Population']}"
      puts "Number of State :  #{COUNTRY_DATABASE[country_name]['numberOfState']}"
      puts "Army strength :  #{COUNTRY_DATABASE[country_name]['ArmyStrength']}"
      puts "State :  #{COUNTRY_DATABASE[country_name]['stateOfCountry']}"
      return true
    else
      return false
    end
  end
end


while 1
  country = Country.new
  puts "************************"
  puts "\t1: Register country"
  puts "\t2: Display country"
  puts "\t3: Exit"
  puts "************************"
  print "select option : "
  user_choice = gets.chomp.to_i

  case user_choice
  when 1
    puts "please fill following country details"
    print "Name :"
    country_name = gets.chomp.upcase
    print "Population(in cr) : "
    country_population = gets.chomp.to_i
    print "GDP : "
    gdp = gets.chomp.to_i
    print "Number of state : "
    no_of_state = gets.chomp.to_i
    print"Army strength(in cr) : "
    country_army_strength = gets.chomp.to_i
    print"Contry state(develop or developing) : "
    state_of_country = gets.chomp.downcase   
    Country.new.registerCountry country_name, country_population, gdp, no_of_state, country_army_strength,state_of_country
    puts "You successfully register the country."

  when 2
    print "Country name : "
    user_country_name = gets.chomp.upcase
    if Country.new.displayCountryInfo(user_country_name)
      puts "*****************************"
      puts "1. Get Loan(IMF)"
      puts "2. Get Loan(World Bank)"
      puts "3. Seat in UN"
      puts "4. Can Win war"
      puts "5. Exit"
      puts "*****************************"
      puts "Select a option"
      user_choice = gets.chomp.to_i

      case user_choice
      when 1
        state_of_country = COUNTRY_DATABASE[user_country_name]['stateOfCountry']
        gdp = COUNTRY_DATABASE[user_country_name]['gdp']
        no_of_state = COUNTRY_DATABASE[user_country_name]['numberOfState']
        population = COUNTRY_DATABASE[user_country_name]['Population']

        if country.loan_from_IMF? state_of_country , gdp, no_of_state, population
          puts "#{country_name} can get loan from IMF"
        else
          puts "#{country_name} can't get loan from IMF"
        end

      when 2

        gdp = COUNTRY_DATABASE[user_country_name]['gdp']
        population = COUNTRY_DATABASE[user_country_name]['Population']

        if country.loan_from_world_bank? gdp,population
          puts "#{country_name} can get loan from world bank"
        else
          puts "#{country_name} can't get loan from world bank"
        end

      when 3
        
        state_of_country = COUNTRY_DATABASE[user_country_name]['stateOfCountry']
        gdp = COUNTRY_DATABASE[user_country_name]['gdp']
        population = COUNTRY_DATABASE[user_country_name]['Population']

        if country.get_seat_in_UN? gdp , population , state_of_country
          puts "#{country_name} can have seat in UN Security council"
        else
          puts "#{country_name} cannot have seat in UN Security council"
        end

      when 4
        
        gdp = COUNTRY_DATABASE[user_country_name]['gdp']
        army_strength = COUNTRY_DATABASE[user_country_name]['ArmyStrength']

        if country.can_win_war? army_strength, gdp
          puts "#{country_name} can win war"
        else
          puts "#{country_name} cannot win war"
        end

      when 5
        exit
      else
        puts "Enter valid option."
      end
    else
      puts "Country does not exist"
    end
  when 3
    exit
  else
    puts "Enter valid option."
  end
end