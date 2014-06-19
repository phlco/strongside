require 'spec_helper'

describe Account do
  it ".new" do
    account = Account.new
    expect(account.balance).to be_true
  end
end
