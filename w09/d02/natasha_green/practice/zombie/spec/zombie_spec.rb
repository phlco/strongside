require_relative 'spec_helper'
require_relative '../lib/zombie'

describe Zombie do
  it "is name Ash" do
    zombie = Zombie.new
    expect(zombie.name).to eq 'Ash'
  end

  it "has no brains" do
    zombie = Zombie.new
    expect(zombie.brains).to be < 1
    # the < symbol is called a matcher
  end

  it "is dead" do
    zombie = Zombie.new
    expect(zombie.alive).to be_false
  end

  it 'is hungry' do
    zombie = Zombie.new
#    expect(zombie.hungry?).to be_true #this works fine
    expect(zombie).to be_hungry #this is another way to do it
    #It is called the predicate matcher
  end
end
