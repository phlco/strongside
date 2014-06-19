require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :password_digest => "Password Digest",
        :user_name => "User Name"
      ),
      stub_model(User,
        :password_digest => "Password Digest",
        :user_name => "User Name"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
  end
end
