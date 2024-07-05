require 'pry-nav'
require_relative 'account'
require_relative 'user_initializer'

class Run
	def initialize(user_details)
   @user_details = user_details
   Account.initialize_users(@user_details)
	end

  def start
    puts "Welcome to the ATM"
    loop do
      display_options
      handle_choice(get_user_input("Enter your choice: ", Integer))
    end
  end

  def display_options
    puts "\nOptions:"
		puts "1. Create User"
    puts "2. All User"
		puts "3. credit amount"
		puts "4. withdraw or debit amount"
    puts "5. Exit"
  end

  def handle_choice(choice)
    case choice
		when 1 then create_user
    when 2 then show_all_user
		when 3 then credit_amount
		when 4 then debit_amount
    when 5 then exit_program
    else puts "Invalid option. Please try again."
    end
  end

  def show_all_user
    Account.user_details
  end
	
	def debit_amount
		details = request_debit_amount_details
		Account.debit_amount_by_specific_user(details[:account_number], details[:amount])
	end
	
	def request_debit_amount_details
		account_number = get_user_input("user account number: ", Integer)
		amount = get_user_input("user amount: ", Integer)
		{ account_number: account_number, amount: amount}
	end

	def credit_amount
		details = request_credit_amount_details
    Account.credited_amount_by_specific_user(details[:account_number], details[:amount])
	end

	def create_user
    details = request_create_user_details
    Account.create_user(details[:name], details[:age], details[:amount], details[:account_number])
  end

	def request_credit_amount_details
    account_number = get_user_input("user account number: ", Integer)
		amount = get_user_input("user amount: ", Integer)
		{ account_number: account_number, amount: amount}
	end

	def request_create_user_details
		name = get_user_input("user name: ", String)
    age = get_user_input("user age: ", Integer)
		account_number = get_user_input("user account number: ", Integer)
		amount = get_user_input("user amount: ", Integer)
    { name: name, age: age , amount: amount, account_number: account_number}
	end

  def request_account_details
    name = get_user_input("name: ", String)
    balance = get_user_input("Balance: ", Integer)
    { name: name, balance: balance }
  end

  def get_user_input(prompt, type)
    print prompt
    input = gets.chomp
    return input.to_i if type == Integer
    input
  end

  def exit_program
    puts "Thank you for using the ATM. Goodbye!"
    exit
  end
end

user_details = user_initializer

cli = Run.new(user_details)
cli.start