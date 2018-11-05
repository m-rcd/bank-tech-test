# frozen_string_literal: true

require 'account'

describe 'Deposit' do
  it 'should be able to deposit money in account' do
    account = Account.new
    account.deposit(1000)
    expect(account.balance).to eq(1000)
  end

  describe 'Withdraw' do
    it 'should be able to Withdraw money' do
      account = Account.new
      account.deposit(1000)
      account.withdraw(500)
      expect(account.balance).to eq(500)
    end
  end
end
