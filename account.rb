require 'pry-nav'

class Account

	@@users = []
  
  def self.initialize_users(user_details)
    @@users = user_details
  end

  def self.create_user(name, age, balance, account_number)
    @@users << { name: name, age: age, balance: balance, account_number: account_number }
    puts "User created successfully!"
  end

  def self.user_details
    if @@users.empty?
      puts "No users available."
    else
      @@users.each_with_index do |user, index|
        puts "\nUser #{index + 1}:"
        puts "Name: #{user[:name]}"
        puts "Age: #{user[:age]}"
				puts "Account number: #{user[:account_number]}"
        puts "Balance: #{user[:amount]}"
      end
    end
  end

	def self.credited_amount_by_specific_user(account_number, amount)
    user = @@users.find { |u| u[:account_number] == account_number.to_s }
    if user
      user[:amount] = user[:amount].to_i + amount
      puts "Amount credited successfully!"
      puts "New balance for account number #{account_number}: #{user[:amount]}"
    else
      puts "Account number not found."
    end
  end
	
	def self.debit_amount_by_specific_user(account_number, amount)
    user = @@users.find { |u| u[:account_number] == account_number.to_s }
    if user
      user[:amount] = user[:amount].to_i - amount
      puts "Amount debited successfully!"
      puts "New balance for account number #{account_number}: #{user[:amount]}"
    else
      puts "Account number not found."
    end
  end
end
