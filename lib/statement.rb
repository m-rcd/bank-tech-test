class Statement
  def return_statement(history)
    statement = 'Date || Credit || Debit || Balance'
    history.reverse_each do |transaction|
      date = format_date(transaction[:date])
      balance = format_price(transaction[:balance])

      if credit?(transaction)
        credit = format_price(transaction[:credit])
        statement += "\n#{date} || #{credit} || || #{balance}"
      else
        debit = format_price(transaction[:debit])
        statement += "\n#{date} || || #{debit} || #{balance}"
      end
    end
    statement
  end

  private

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  def format_price(price)
    format('%.2f', price)
  end

  def credit?(transaction)
    true if transaction[:type] == 'credit'
  end
end
