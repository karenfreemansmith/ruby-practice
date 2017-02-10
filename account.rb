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

end

bank_account = BankAccount.new("Karen")
bank_account.credit("Paycheck", 1250)
bank_account.debit("Groceries", 150)
puts bank_account.inspect
