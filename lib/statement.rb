class Statement

  def header
    return 'Date || Credit || Debit || Balance '
  end

  def print_statement(transactions)
    statement = header + '\n'
    transactions.each do |transaction|
    statement += " #{transaction[:date]} || #{transaction[:credit]} || || #{transaction[:balance]}"
    return statement
    end
  end
end
