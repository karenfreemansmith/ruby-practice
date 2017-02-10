class BankAccount
  def initialize(name)
    @name = name
    @transactions = []
    add_transaction("Beginning Balance", 0)
  end

  def credit(description, amount)
    add_transaction(description, amount)
  end

  def debit(description, amount)
    add_transaction(description, -amount)
  end

  def add_transaction(description, amount)
    @transactions.push(description: description, amount: amount)
  end

  def balance
    balance=0
    @transactions.each do|transaction|
      balance += transaction[:amount]
    end
    return balance
  end

  def to_s
    "Name: #{@name}, Balance: $#{sprintf("%0.2f", balance)}"
  end

  def print_register
    puts "#{@name}'s Bank Account'"
    puts "Description".ljust(30) + "Amount".rjust(10)
    puts "".ljust(40, "-")
    @transactions.each do |transaction|
      puts transaction[:description].ljust(30) + sprintf("%0.2f", transaction[:amount].to_s).rjust(10)
    end
    puts "".ljust(40, "-")
    puts "Balance:".ljust(30) + "$#{sprintf("%0.2f", balance)}".rjust(10)
  end

end

bank_account = BankAccount.new("Karen")
bank_account.credit("Paycheck", 1250)
bank_account.debit("Groceries", 150)
puts bank_account
puts "Register: "
bank_account.print_register
