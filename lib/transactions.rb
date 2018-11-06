class Transactions
  attr_reader :history

  def initialize
    @history = []
  end

  def add_deposit(amount, balance)
    @history << { date: date_today,
                       credit: format_price(amount),
                       balance: format_price(balance),
                       type: 'credit' }
  end

  def add_withdrawal(amount, balance)
    @history << { date: date_today,
                       debit: format_price(amount),
                       balance: format_price(balance),
                       type: 'debit' }
  end

  private

  def date_today
    Date.today.strftime('%d/%m/%Y')
  end

  def format_price(price)
    format('%.2f', price)
  end
end
