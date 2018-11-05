# frozen_string_literal: true

require 'account'

describe 'User can make transactions' do
  context 'Deposit' do
    it 'should be able to deposit money in account' do
      account = Account.new
      account.deposit(1000)
      expect(account.balance).to eq(1000)
    end
  end

  context 'Withdraw' do
    it 'should be able to Withdraw money' do
      account = Account.new
      account.deposit(1000)
      account.withdraw(500)
      expect(account.balance).to eq(500)
    end
  end
end

describe 'Account statement' do
  context 'Before any transaction' do
    it 'should print empty statement' do
      account = Account.new
      statement = Statement.new
      expect(statement.print_statement(account.transactions)).to eq('Date || Credit || Debit || Balance ')
    end
  end

  context 'After a deposit' do
    it 'should be able to print statement with deposit transaction' do
      account = Account.new
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      account.deposit(1000)
      statement = Statement.new
      expect(statement.print_statement(account.transactions)).to eq("Date || Credit || Debit || Balance \n 19/09/2018 || 1000.00 || || 1000.00")
    end
  end

  context 'After a withdrawal' do
    it 'should be able to print statement with deposit and withdrawal transactions' do
      account = Account.new
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      account.deposit(1000)
      account.withdraw(500)
      statement = Statement.new
      expect(statement.print_statement(account.transactions)).to eq("Date || Credit || Debit || Balance \n 19/09/2018 || 1000.00 || || 1000.00 \n 19/09/2018 || || 500.00 || 500.00")
    end
  end
end
