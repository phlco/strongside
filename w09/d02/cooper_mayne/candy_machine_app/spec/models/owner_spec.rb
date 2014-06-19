require 'spec_helper'
describe Owner do
  let(:owner) { Owner.new(name:"coop") }

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:candy)}
  it {should validate_numericality_of(:candy)}
  it {should validate_presence_of(:money)}
  it "can save" do
    expect(owner.save).to be_true
  end

  context "when created" do

  end

end
