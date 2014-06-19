require_relative('../lib/package')

describe Package do
  it "should have a ship_to_address" do
    package = Package.new(ship_to_address: "920 Broadway")
    expect(package.ship_to_address).to eq("920 Broadway")
  end

  it "should have a content array" do
    package = Package.new
    expect(package.contents.class).to eq(Array)
  end

  it "should have an is_fragile boolean" do
    package = Package.new(is_fragile: true)
    expect(package.is_fragile?).to eq(true)
  end

  it "should have an is_broken boolean" do
    package = Package.new(is_broken: false)
    expect(package.is_broken?).to eq(false)
  end

  it "should have a method called shake" do
    package = Package.new
    package.shake
    expect(package.is_broken?).to eq(false)
  end

  it "should break if the shake method is called" do
    package = Package.new(is_fragile: true)
    package.shake
    expect(package.is_broken?).to eq(true)
  end

end