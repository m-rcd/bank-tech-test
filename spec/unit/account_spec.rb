require 'bank_account'

describe Account do
  subject(:account) { described_class.new }
  subject(:statement) do
    double('statement', return_statement: 'Date || Credit'\
   " || Debit || Balance\n19/09/2018 || 1000.00 || || 1000.00\n")
  end

  context '#deposit' do
    it 'should save the transaction to transactions array' do
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      account.deposit(1000)

      expect(account.transactions).to include(date: '19/09/2018',
                                              credit: '1000.00',
                                              balance: '1000.00',
                                              type: 'credit')
    end
  end

  context '#Withdraw' do
    it 'should save the transaction to transactions array' do
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      account.deposit(1000)
      account.withdraw(500)

      expect(account.transactions).to include(date: '19/09/2018',
                                              debit: '500.00',
                                              balance: '500.00',
                                              type: 'debit')
    end
  end

  context '#print_statement' do
    it 'should be able to get statement' do
      account2 = Account.new(statement)
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      account2.deposit(1000)

      expect { account2.print_statement }.to output('Date || Credit || Debit '\
        "|| Balance\n19/09/2018 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end
