# frozen_string_literal: true

class Statement
  def return_statement(transactions)
    statement = header
    transactions.each do |transaction|
      if transaction[:type] == 'credit'
        statement += "\n #{transaction[:date]} || #{transaction[:credit]} ||"\
        " || #{transaction[:balance]}"
      elsif transaction[:type] == 'debit'
        statement += " \n #{transaction[:date]} || || #{transaction[:debit]}"\
        " || #{transaction[:balance]}"
      end
    end
    statement
  end

  private

  def header
    'Date || Credit || Debit || Balance '
  end
end
