require 'spec_helper'

describe "cats/index" do
  before(:each) do
    assign(:cats, [
      stub_model(Cat),
      stub_model(Cat)
    ])
  end

  it "renders a list of cats" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
