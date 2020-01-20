class Account

  attr_reader :holder_name, :basic_amount, :account_type, :account_number

  @@no_of_account = 0

  def initialize(holder_name,basic_amount,account_type)
    @@no_of_account += 1
    @account_number = @@no_of_account
    @holder_name = holder_name
    @account_balance = basic_amount
    @account_type = account_type
  end

  def deposit(deposit_amount)
    @account_balance += deposit_amount
  end

  def withdraw(withdraw_amount)
    if @account_balance - withdraw_amount < 0 
      put " exceeding lower limit"
      return  @account_balance -= withdraw_ammount
    end
  end

  def get_balance
    puts "Account_no : #{@account_number}"
    puts "Name : #{@holder_name}"
    puts "Balance : #{@account_balance}"
    puts "Account type : #{@account_type}\n"
  end
end

class SavingAccount < Account
  attr_accessor :ROI

  def initialize(holder_name, basic_amount)
    super(holder_name, basic_amount, account_type)
    @@ROI = 8
    puts "Account created successfully"
    get_balance
  end	

  def cal_interest(months)
    puts "Interest of #{months} on #{@account_balance} : #{months*@account_balance*@@ROI/100}"
  end
end



class CurrentAccount < Account
  attr_accessor :ROI

  def initialize(holder_name, basic_amount)
    super(holder_name, basic_amount, account_type)
    @@ROI = 6
    puts "Account created successfully"
    get_balance
  end 

  def cal_interest(months)
    puts "Interest of #{months} on #{@account_balance} : #{months*@account_balance*@@ROI/100}"
  end
end

def create_account
  print "Name of Account Holder : "
  holder_name = gets.chomp

  print "Account type(saving or current) : "
  account_type = gets.chomp.downcase

  while(1)
    print "**You have to deposit 500 as minimum amount : "
    basic_amount = gets.chomp.to_f

    if basic_amount >=500
      if account_type == "saving"
        save_account = SavingAccount.new(holder_name, basic_amount)
        Account_all << save_account
      elsif account_type == "current"
        current_account = CurrentAccount.new(holder_name, basic_amount)
        Account_all << current_account
      else
        puts "Not valid type of account"
      end
      break
    else
      puts "Amount is less than minimum balance"
    end

  end
end 

Account_all = []

while 1
  puts "\n1.Create account\n2.Withdraw\n3.Deposite\n4.Check balance\n5.calculate interest\n6.Exit\nEnter choice:"
  user_choice = gets.chomp.to_i

  if user_choice == 1
    create_account
    puts Account_all

  elsif user_choice == 2
    print "Account_no : "
    account_number = gets.chomp.to_i

    Account_all.each do |itr|
      if itr.account_number == account_number  
        print "Enter withdraw amount:"
        withdraw_amount = gets.chomp.to_f
        itr.withdraw(withdraw_amount)
        itr.get_balance
      end
    end

  elsif user_choice == 3
    print "Account_no : "
    account_number = gets.chomp.to_i

    Account_all.each do |itr|
      if itr.account_number == account_number  
        print "Enter deposite amount:"
        deposit_amount = gets.chomp.to_f
        itr.deposit(deposit_amount)
        itr.get_balance
      end
    end

  elsif user_choice == 4
    print "Account_no : "
    account_number = gets.chomp.to_i

    Account_all.each do |itr|
      if itr.account_number == account_number
        itr.get_balance
      end
    end

  elsif user_choice == 5
    print "Account_no : "
    account_number = gets.chomp.to_i

    Account_all.each do |itr|
      if itr.account_number == account_number
        print"enter months:"
        months = gets.chomp.to_i
        itr.cal_interest(months)
      end
    end

  elsif choice == 6
    exit

  else
    puts "Please enter correct choice"
  end
end
