require 'date'

class Account
  attr_reader :balance, :transactions

  def initialize(statement = Statement.new)
    @balance = 0
    @transactions = []
    @statement = statement
  end

  def deposit(amount)
    raise 'Deposit cannot be a string!' if amount.kind_of? String
    raise 'Deposit cannot be negative!' if amount < 0
    @balance += amount
    @transactions << { date: date_today,
                       credit: format_price(amount),
                       balance: format_price(@balance),
                       type: 'credit' }
  end

  def withdraw(amount)
    raise 'Withdrawal amount cannot be a string!' if amount.kind_of? String
    raise 'Not enough money in your account!' if amount > @balance
    raise 'Withdrawal amount cannot be negative!' if amount < 0
    @balance -= amount
    @transactions << { date: date_today,
                       debit: format_price(amount),
                       balance: format_price(@balance),
                       type: 'debit' }
  end

  def print_statement
    puts @statement.return_statement(@transactions)
  end

  private

  def date_today
    Date.today.strftime('%d/%m/%Y')
  end

  def format_price(price)
    format('%.2f', price)
  end
end
