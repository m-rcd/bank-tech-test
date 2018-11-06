class Statement
  def return_statement(transactions)
    statement = header
    transactions.reverse_each do |transaction|
      if credit?(transaction)
        statement += "\n#{transaction[:date]} || #{transaction[:credit]} ||"\
        " || #{transaction[:balance]}"
      else
        statement += "\n#{transaction[:date]} || || #{transaction[:debit]}"\
        " || #{transaction[:balance]}"
      end
    end
    statement
  end

  private

  def header
    'Date || Credit || Debit || Balance'
  end

  def credit?(transaction)
    true if transaction[:type] == 'credit'
  end
end
