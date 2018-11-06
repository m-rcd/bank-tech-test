require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  subject(:empty_account) { double('account', transactions: []) }
  subject(:credit_account) do
    double('account', transactions: [
             { date: Date.today, credit: '1000.00', balance: '1000.00',
               type: 'credit' }
           ])
  end
  subject(:debit_account) do
    double('account', transactions: [
             { date: Date.today, credit: '1000.00', balance: '1000.00',
               type: 'credit' }, { date: Date.today, debit: '500.00',
                                   balance: '500.00', type: 'debit' }
           ])
  end

  context 'before any transaction' do
    it 'prints empty statement' do
      expect(statement.return_statement(empty_account.transactions)).to eq('Date'\
       " || Credit || Debit || Balance")
    end
  end

  context 'after deposit' do
    it 'prints statement with deposit transaction' do
      allow(Date).to receive(:today).and_return(Date.parse('19/11/2018'))

      expect(statement.return_statement(credit_account.transactions)).to eq(
        "Date || Credit || Debit || Balance\n19/11/2018 || 1000.00 || ||"\
        " 1000.00"
      )
    end
  end

  context 'after withdrawal' do
    it 'prints statement with withdrawal transaction' do
      allow(Date).to receive(:today).and_return(Date.parse('19/11/2018'))

      expect(statement.return_statement(debit_account.transactions)).to eq(
        "Date || Credit || Debit || Balance\n19/11/2018 || || 500.00 "\
        "|| 500.00\n19/11/2018 || 1000.00 || || 1000.00"
      )
    end
  end
end
