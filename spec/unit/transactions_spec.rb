require 'transactions'

describe Transactions do
  let(:account) { double('account') }
  let(:transactions) { described_class.new }

  context '#add_deposit' do
    it 'should be able to save a deposit' do
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      transactions.add_deposit(1000, 1000)

      expect(transactions.history).to include(date: '19/09/2018',
      credit: '1000.00',
      balance: '1000.00',
      type: 'credit')
    end
  end

  context '#add_withdrawal' do
    it 'should be able to save a withdrawal' do
      allow(Date).to receive(:today).and_return(Date.parse('19/09/2018'))
      transactions.add_deposit(1000, 1000)

      transactions.add_withdrawal(500, 500)
      expect(transactions.history).to include(date: '19/09/2018',
        debit: '500.00',
        balance: '500.00',
        type: 'debit')
    end
  end
end
