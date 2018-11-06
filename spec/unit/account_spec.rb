require 'account'

describe Account do
  subject(:transactions) do
    double('transactions', history: [], add_deposit: { date: '19/09/2018',
                                            credit: '1000.00',
                                            balance: '1000.00',
                                            type: 'credit' },
                                      add_withdrawal: { date: '19/09/2018',
                                            debit: '500.00',
                                            balance: '500.00',
                                            type: 'debit' })
  end

  subject(:statement) do
    double('statement', return_statement: 'Date || Credit'\
      " || Debit || Balance\n19/09/2018 || 1000.00 || || 1000.00\n")
  end
  subject(:account) { described_class.new(statement, transactions) }

  context '#deposit' do
    it 'should increase balance' do
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      account.deposit(1000)

      expect(account.balance).to eq(1000)
    end

    context 'Edge cases' do
      it 'should raise an error if user insert a string' do
        error = 'Deposit cannot be a string!'

        expect { account.deposit('1000') }.to raise_error(error)
      end

      it 'should raise an error if user insert a negative amount' do
        error = 'Deposit cannot be negative!'

        expect { account.deposit(-100) }.to raise_error(error)
      end
    end
  end

  context '#Withdraw' do
    it 'should decrease balance ' do
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      account.deposit(1000)
      account.withdraw(500)

      expect(account.balance).to eq(500)
    end

    context 'Edge cases' do
      it 'should raise error if amount more than available money in account' do
        allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
        account.deposit(1000)
        error = 'Not enough money in your account!'

        expect { account.withdraw(1200) }.to raise_error(error)
      end

      it 'should raise error if amount is string' do
        allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
        account.deposit(1000)
        error = 'Withdrawal amount cannot be a string!'

        expect { account.withdraw('500') }.to raise_error(error)
      end

      it 'should raise error if amount is negative' do
        allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
        account.deposit(1000)
        error = 'Withdrawal amount cannot be negative!'

        expect { account.withdraw(-500) }.to raise_error(error)
      end
    end
  end

  context '#print_statement' do
    it 'should be able to get statement' do
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      account.deposit(1000)

      expect { account.print_statement }.to output('Date || Credit || Debit '\
        "|| Balance\n19/09/2018 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end
