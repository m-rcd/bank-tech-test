# frozen_string_literal: true

require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  let(:account) { double('account', transactions: [{date: '19/11/2018', credit: '1000.00', balance: '1000.00', type: 'credit'}]) }

  it 'has a header' do
   expect(statement.header).to eq('Date || Credit || Debit || Balance ')
  end

  it 'prints statement' do
    expect(statement.print_statement(account.transactions)).to eq('Date || Credit || Debit || Balance \n 19/11/2018 || 1000.00 || || 1000.00')
  end

end
