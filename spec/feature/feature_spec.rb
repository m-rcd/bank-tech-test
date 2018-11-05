# frozen_string_literal: true

require 'account'
require 'statement'

describe 'Features Account' do
  describe 'User can make transactions' do
    context 'Deposit' do
      it 'should be able to deposit money in account' do
        account = Account.new
        account.deposit(1000)

        expect(account.balance).to eq(1000)
      end
    end

    context 'Withdraw' do
      it 'should be able to Withdraw money from account' do
        account = Account.new
        account.deposit(1000)
        account.withdraw(500)

        expect(account.balance).to eq(500)
      end
    end
  end

  describe 'Statement' do
    context 'before any transaction' do
      it 'can print empty statement' do
        account = Account.new

        expect(account.get_statement).to eq("Date || Credit || Debit ||"\
          " Balance ")
      end
    end

    context 'after transactions' do
      context 'After a deposit' do
        it 'can print statement with deposit transaction' do
          account = Account.new
          allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
          account.deposit(1000)

          expect(account.get_statement).to eq("Date || Credit || Debit ||"\
            " Balance \n 19/09/2018 || 1000.00 || || 1000.00")
        end
      end

      context 'After a withdrawal' do
        it 'can print statement with deposit and withdrawal transactions' do
          account = Account.new
          allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
          account.deposit(1000)
          account.withdraw(500)
          expect(account.get_statement).to eq("Date || Credit || Debit ||"\
            " Balance \n 19/09/2018 || 1000.00 || || 1000.00 \n 19/09/2018 ||"\
            " || 500.00 || 500.00")
        end
      end
    end
  end
end
