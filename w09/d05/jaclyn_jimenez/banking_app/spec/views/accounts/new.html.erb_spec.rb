require 'spec_helper'

describe "accounts/new" do
  before(:each) do
    assign(:account, stub_model(Account,
      :balance => "",
      :transaction_list => "MyText"
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", accounts_path, "post" do
      assert_select "input#account_balance[name=?]", "account[balance]"
      assert_select "textarea#account_transaction_list[name=?]", "account[transaction_list]"
    end
  end
end
