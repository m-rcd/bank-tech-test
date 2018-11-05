class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << { date: format_date(Date.today), credit: amount, balance: @balance }
  end

  private

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end
end
