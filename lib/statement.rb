class Statement

  def header
    return 'Date || Credit || Debit || Balance '
  end

  def print_statement(transactions)
    statement = header
    transactions.each do |transaction|
      statement += "\n #{transaction[:date]} || #{transaction[:credit]} || || #{transaction[:balance] }"
    end
    return statement
  end
end
