require 'spec_helper'

describe "accounts/edit" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :balance => "",
      :transaction_list => "MyText"
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", account_path(@account), "post" do
      assert_select "input#account_balance[name=?]", "account[balance]"
      assert_select "textarea#account_transaction_list[name=?]", "account[transaction_list]"
    end
  end
end
