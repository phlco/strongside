require 'spec_helper'

describe "transactions/index" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :type => "Type",
        :amount => 1,
        :memo => "Memo"
      ),
      stub_model(Transaction,
        :type => "Type",
        :amount => 1,
        :memo => "Memo"
      )
    ])
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Memo".to_s, :count => 2
  end
end
