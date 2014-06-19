require 'spec_helper'

describe Zombie do
  it 'is invalid without a name' do
    zombie = Zombie.new #we instantiated a zombie
    expect(zombie).to_not be_valid
    #be_valid is a predicate matcher it will call the activerecord valid? method to make sure zombie is valid
  end



end

