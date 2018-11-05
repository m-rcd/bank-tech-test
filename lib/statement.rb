class Statement

  def header
    return 'Date || Credit || Debit || Balance '
  end

  def print_statement(transactions)
    statement = header
    transactions.each do |transaction|
      if transaction[:type] == 'credit'
        statement += "\n #{transaction[:date]} || #{transaction[:credit]} || || #{transaction[:balance] }"
      elsif transaction[:type] == 'debit'
        statement += " \n #{transaction[:date]} || || #{transaction[:debit]} || #{transaction[:balance] }"
      end
    end
   return statement
 end
end
