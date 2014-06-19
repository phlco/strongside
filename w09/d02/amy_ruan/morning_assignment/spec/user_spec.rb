require_relative '../lib/user'

describe User do

  let(:user) {
    User.new({
      gender: "male",
      first_name: "Harry",
      last_name: "Potter",
      age: 37,
      married: true
    }) }

  it "has the following getter methods" do
    expect(user.gender).to eq ("male")
    expect(user.first_name).to eq ("Harry")
    expect(user.last_name).to eq("Potter")
    expect(user.age).to eq(37)
    expect(user.is_married?).to eq(false)
  end

  it "tells you what you can do in life at 16" do
    user.age = 16
    expect(user.abilities).to include(:drive)
  end

  it "tells you what you can do in life at 18" do
    user.age = 18
    expect(user.abilities).to include(:drive,:vote)
  end

  it "tells you what you can do in life at 25" do
    user.age = 25
    expect(user.abilities).to include(:drive,:vote,:rent)
  end

  it "tells you what you can do in life at 35" do
    user.age = 35
    expect(user.abilities).to include(:drive,:vote,:rent,:president)
  end

  it "tells you formal name if you're female and 20 or over and married" do
    user.age = 21
    user.gender = "female"
    user.is_married = false
    expect(user.formal_name).to eq("Ms. Harry Potter")
  end

  it "tells you formal name if you're female and 20 or over and married" do
    user.age = 21
    user.gender = "female"
    user.is_married = true
    expect(user.formal_name).to eq("Mrs. Harry Potter")
  end


  it "tells you formal name if you're female and under 20" do
    user.age = 12
    user.gender = "female"
    user.is_married = true
    expect(user.formal_name).to eq("Harry Potter")
  end

  it "tells you formal name if you're male and 20 or over" do
    expect(user.formal_name).to eq("Mr. Harry Potter")
  end


  it "tells you formal name if you're male and under 20" do
    user.age = 12
    expect(user.formal_name).to eq("Harry Potter")
  end
end