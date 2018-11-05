# frozen_string_literal: true

require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  subject(:empty_account) { double('account', transactions: [])}
  subject(:credit_account) { double('account', transactions: [{date: '19/11/2018', credit: '1000.00', balance: '1000.00', type: 'credit'}]) }
  

  it 'has a header' do
   expect(statement.header).to eq('Date || Credit || Debit || Balance ')
  end

 context 'before any transaction' do
   it 'prints empty statement' do
     expect(statement.print_statement(empty_account.transactions)).to eq('Date || Credit || Debit || Balance ')
   end
 end

 context 'after deposit' do
   it 'prints statement with deposit transaction' do
     expect(statement.print_statement(credit_account.transactions)).to eq("Date || Credit || Debit || Balance \n 19/11/2018 || 1000.00 || || 1000.00")
   end
 end
end
