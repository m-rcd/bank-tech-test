# frozen_string_literal: true

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << { date: format_date(Date.today), credit: format_price(amount),
                       balance: format_price(@balance) }
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << { date: format_date(Date.today), debit: format_price(amount),
                       balance: format_price(@balance) }
  end

  private

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  def format_price(price)
    sprintf('%.2f', price)
  end
end
