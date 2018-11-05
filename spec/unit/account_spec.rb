require 'account'

describe 'Account' do
  context '#initialize' do
    it 'starts with an empty balance' do
      account = Account.new
      expect(account.balance).to eq(0)
    end

    it 'starts with an empty actions array' do
      account = Account.new
      expect(account.transactions).to be_empty
    end
  end

  context '#deposit' do
    it 'should increase balance' do
      account = Account.new
      account.deposit(1000)
      expect(account.balance).to eq(1000)
    end

    it 'should add the transactions to transactions array' do
      account = Account.new
      allow(Date).to receive(:today).and_return(Date.parse("19/09/2018"))
      account.deposit(1000)
      expect(account.transactions).to include({ date: '19/09/2018', credit: 1000, balance: 1000 })
    end
  end
end
