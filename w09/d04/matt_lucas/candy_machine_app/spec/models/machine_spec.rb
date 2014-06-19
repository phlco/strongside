require 'spec_helper'

describe Machine do

  # let(:owner) do
  #   Owner.create(
  #     password: "kickhash",
  #     password_confirmation: "kickhash",
  #     email: "me@jonl.org"
  #   )
  # end

  # let(:machine) do
  #   p = Machine.create(
  #     candy: 1000,
  #     money: 0,
  #     candy_price: 0.25,
  #     owner_id: 1
  #   )
  # end
  it { should validate_presence_of(:candy) }
  it { should validate_presence_of(:money) }
  it { should validate_presence_of(:owner_id) }
  it { should validate_presence_of(:candy_price) }

  # it "sells a piece of candy" do
  #   expect(p.sell_candy(1)).to eq(999)
  # end
  # it "lives to make bank" do
  #   n.sell_candy(4)
  #   expect(n.money).to eq(1.00)
  # end

end