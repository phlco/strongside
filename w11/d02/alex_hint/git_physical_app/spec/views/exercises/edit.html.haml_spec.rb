require 'spec_helper'

describe "exercises/edit" do
  before(:each) do
    @exercise = assign(:exercise, stub_model(Exercise,
      :name => "MyString",
      :difficulty => 1,
      :calories => 1
    ))
  end

  it "renders the edit exercise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", exercise_path(@exercise), "post" do
      assert_select "input#exercise_name[name=?]", "exercise[name]"
      assert_select "input#exercise_difficulty[name=?]", "exercise[difficulty]"
      assert_select "input#exercise_calories[name=?]", "exercise[calories]"
    end
  end
end
