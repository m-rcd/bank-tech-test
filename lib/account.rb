require 'date'

class Account
  attr_reader :balance, :transactions

  def initialize(statement = Statement.new, transactions = Transactions.new)
    @balance = 0
    @transactions = transactions
    @statement = statement
  end

  def deposit(amount)
    raise 'Deposit cannot be a string!' if amount.kind_of? String
    raise 'Deposit cannot be negative!' if amount.negative?

    @balance += amount
    @transactions.add_deposit(amount, @balance)
  end

  def withdraw(amount)
    raise 'Withdrawal amount cannot be a string!' if amount.kind_of? String
    raise 'Not enough money in your account!' if amount > @balance
    raise 'Withdrawal amount cannot be negative!' if amount.negative?

    @balance -= amount
    @transactions.add_withdrawal(amount, @balance)
  end

  def print_statement
    puts @statement.return_statement(@transactions.history)
  end
end
