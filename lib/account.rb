require 'date'

class Account
  attr_reader :balance

  def initialize(statement = Statement.new)
    @balance = 0
    @transactions = []
    @statement = statement
  end

  def deposit(amount)
    raise 'Deposit cannot be a string!' if amount.kind_of? String
    raise 'Deposit cannot be negative!' if amount.negative?

    @balance += amount
    @transactions << { date: Date.today,
                       credit: amount,
                       balance: balance,
                       type: 'credit' }
  end

  def withdraw(amount)
    raise 'Withdrawal amount cannot be a string!' if amount.kind_of? String
    raise 'Not enough money in your account!' if amount > @balance
    raise 'Withdrawal amount cannot be negative!' if amount.negative?

    @balance -= amount
    @transactions << { date: Date.today,
                       debit: amount,
                       balance: balance,
                       type: 'debit' }
  end

  def print_statement
    puts @statement.return_statement(@transactions)
  end
end
