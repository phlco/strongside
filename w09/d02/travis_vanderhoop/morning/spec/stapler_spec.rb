require_relative 'spec_helper'
require_relative '../stapler'

describe Stapler do
  let(:stapler) do
    Stapler.new
  end

  it "is instantiatable" do
    binding.pry
    expect(stapler.class).to eq(Stapler)
  end

end
