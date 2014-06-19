require 'spec_helper'

describe Owner do
  let(:owner) { Owner.new }

  it { should validate_presence_of :name }

  context 'newly created' do
    it "has no money" do
      expect(owner.money).to eq(0)
    end

    it "has no candy" do
      expect(owner.candy).to eq(0)
    end
  end
end
