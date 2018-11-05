# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }

  context '#initialize' do
    it 'starts with an empty balance' do
      expect(account.balance).to eq(0)
    end

    it 'starts with an empty actions array' do
      expect(account.transactions).to be_empty
    end
  end

  context '#deposit' do
    it 'should increase balance' do
      account.deposit(1000)
      expect(account.balance).to eq(1000)
    end

    it 'should save the deposit transaction to transactions array' do
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      account.deposit(1000)
      expect(account.transactions).to include(date: '19/09/2018',
                                              credit: '1000.00', balance: '1000.00')
    end
  end

  context '#Withdraw' do
    before(:each) do
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      account.deposit(1000)
      account.withdraw(500)
    end

    it 'should decrease balance' do
      expect(account.balance).to eq(500)
    end

    it 'should save the transaction to transactions array' do
      expect(account.transactions).to include(date: '19/09/2018',
                                              debit: '500.00', balance: '500.00')
    end
  end
end
