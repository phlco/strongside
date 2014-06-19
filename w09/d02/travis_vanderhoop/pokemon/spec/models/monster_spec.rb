require 'spec_helper'

describe Monster do

  it "can't be created without a name, species, and trainer_id" do
    monster = Monster.create(name: "Travis")
    expect(monster).to_not be_valid
  end

  it "is created with energy and healthy values of 80" do
    monster = Monster.new(name: "Pikachu", species: "Thunder Rodent", trainer_id: 1)
    monster.save
    # binding.pry
    expect(monster.energy).to eq(80)
    expect(monster.health).to eq(80)
  end

  it "dies if its trainer dies" do
    trainer1 = Trainer.new
    trainer1.password = "kickhash"
    trainer1.password_confirmation = "kickhash"
    trainer1.email = "vanderhoop@me.com"
    trainer1.name = "Travis Vander Hoop"
    trainer1.save

    monster = Monster.new(name: "Pikachu", species: "Thunder Rodent", trainer_id: trainer1.id)
    monster.save
    binding.pry

    expect(monster).to_not be
  end



end


require_relative 'spec_helper'
require_relative '../school'

describe Model do
  let(:school) do
    School.new
  end

  it "does something" do

    expect().to eq()
  end
end
