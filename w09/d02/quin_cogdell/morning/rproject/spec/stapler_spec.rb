require_relative '../lib/stapler'

describe Stapler do

  before(:each) do
    @stapler = Stapler.new
  end

  it 'should be empty when created' do
    expect(@stapler.num_staples).to eq 0
  end

  it 'should accept staples' do
    @stapler.fill(20)
    expect(@stapler.num_staples).to eq 20
  end

  describe '#staple' do

    it 'should exist' do
      expect(@stapler).to respond_to(:staple)
    end

    it 'should not staple if the stapler has no staples' do
      expect(@stapler.staple).to eq false
    end

  end



end


