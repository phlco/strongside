describe Owner do

  let(:owner) do
    Owner.create(
      name: "Rick",
      money: 50,
      van: true
      )
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:money)}
  it { should validate_presence_of(:van) }

  describe "#buy_candy" do
    it "exists" do
      expect(owner).to respond_to(:buy_candy)
    end

    it "adds the inputted amount to 'candy'" do
      owner.buy_candy(50, 0.01)
      expect(owner.candy).to eq(50)
    end

    it "deducts appropriate amount from 'money'" do
      owner.buy_candy(50, 0.01)
      expect(owner.money).to eq(49.50)
    end
  end

  # describe "#get_money" do
  #   it
  # end




end
