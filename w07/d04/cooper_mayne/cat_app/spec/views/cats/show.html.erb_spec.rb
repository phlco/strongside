require 'spec_helper'

describe "cats/show" do
  before(:each) do
    @cat = assign(:cat, stub_model(Cat))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
