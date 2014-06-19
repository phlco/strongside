require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :password_digest => "MyString",
      :user_name => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_password_digest[name=?]", "user[password_digest]"
      assert_select "input#user_user_name[name=?]", "user[user_name]"
    end
  end
end
