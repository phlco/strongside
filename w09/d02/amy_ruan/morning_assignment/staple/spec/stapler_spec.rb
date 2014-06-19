require_relative '../lib/stapler'

describe Stapler do
  let(:stapler) {
    Stapler.new({
      color: "pink",
      is_working: false,
      num_staples: 0
    })
  }

  it "has a color" do
    expect(stapler.color).to eq("pink")
  end

  it "has no staples in the beginning" do
    expect(stapler.num_staples).to eq(0)
  end

  it "does not work without staples in the beginning" do
    expect(stapler.is_working?).to eq (false)
  end

  it "works with staples" do
    stapler.num_staples = 5
    expect(stapler.is_working?).to eq (true)
  end

  it "reloads staples to 10 if asked and staples will work" do
    stapler.reload
    expect(stapler.num_staples).to eq (10)
    expect(stapler.is_working?).to eq (true)
  end
end
