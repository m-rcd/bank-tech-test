# frozen_string_literal: true

class Account
  attr_reader :balance, :transactions

  def initialize(statement = Statement)
    @balance = 0
    @transactions = []
    @statement = Statement.new
  end

  def deposit(amount)
    @balance += amount
    @transactions << { date: date_today,
                       credit: format_price(amount),
                       balance: format_price(@balance),
                       type: 'credit' }
  end

  def withdraw(amount)
    raise 'Not enough money in your account!' if amount > @balance
    @balance -= amount
    @transactions << { date: date_today,
                       debit: format_price(amount),
                       balance: format_price(@balance),
                       type: 'debit' }
  end

  def get_statement
    @statement.print_statement(@transactions)
  end
  
  private

  def date_today
    Date.today.strftime('%d/%m/%Y')
  end

  def format_price(price)
    format('%.2f', price)
  end
end
