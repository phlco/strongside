require 'spec_helper'

describe "exercises/new" do
  before(:each) do
    assign(:exercise, stub_model(Exercise,
      :name => "MyString",
      :difficulty => 1,
      :calories => 1
    ).as_new_record)
  end

  it "renders new exercise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", exercises_path, "post" do
      assert_select "input#exercise_name[name=?]", "exercise[name]"
      assert_select "input#exercise_difficulty[name=?]", "exercise[difficulty]"
      assert_select "input#exercise_calories[name=?]", "exercise[calories]"
    end
  end
end
