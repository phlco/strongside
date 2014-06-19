require_relative 'spec_helper'
require_relative '../lib/user'

describe User do
  it "has a name" do
    user = User.new(name: 'Gary')
    expect(user.name).to eq 'Gary'
  end

end
