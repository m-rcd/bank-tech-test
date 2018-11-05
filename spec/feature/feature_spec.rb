require 'account'

describe 'Deposit' do
  it 'should be able to deposit money in account' do
    account = Account.new
    account.deposit(1000)
    expect(account.balance).to eq(1000)
  end
end
