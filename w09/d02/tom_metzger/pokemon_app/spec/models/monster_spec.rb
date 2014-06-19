require 'spec_helper'

describe Monster do
# very specific way to validate individual attributes when multiple errors are returned
  describe "validation erros" do
    let(:monster){Monster.new}

    it "cannot be created without a name" do
      # monster = Monster.new
      # monster.valid?
      # expect(monster.errors).to have_key(:name)
      expect(monster).to have(1).error_on(:name)
    end
  # alternative one-liner
    it {should validate_presence_of(:name)}


    # it "cannot be created without a species" do
    #   monster = Monster.new
    #   monster.name = "bill"
    #   expect(monster).to_not be_valid
    # end

    # it "cannot be created without a trainer" do
    #   monster = Monster.new
    #   monster.name = "bill"
    #   monster.species = "kitty"
    #   expect(monster).to_not be_valid
    # end

  # REFACTORED versions of the above two tests

    it "cannot be created without a species" do
      # monster = Monster.new
      # monster.valid?
      # expect(monster.errors).to have_key(:species)
      expect(monster).to have(1).error_on(:species)
    end

    it "cannot be created without a trainer" do
      # monster = Monster.new
      # monster.valid?
      # expect(monster.errors).to have_key(:trainer_id)
      expect(monster).to have(1).error_on(:trainer_id)
    end
  end

  describe "creates valid monster" do
    let(:monster){Monster.new(name: "bill", species: "kitty", trainer_id: 1)}

    it "has a health of 80 when created" do
      expect(monster.health).to eq(80)
    end

    it "has an energy of 80 when created" do
      expect(monster.energy).to eq(80)
    end


# create a different context to test the recover method
    context "when #recover" do

      it "gains health with .recover" do
        expect(monster.recover).to eq(90)
      end

    end
  end

# create a different context to test the attack method
  context "#attack" do
    # creates valid monster
    let(:monster) do
      Monster.new(name: "bill", species: "kitty", trainer_id: 1)
    end

    it "loses 10 energy when it attacks another monster" do
      m2 = Monster.new(name: "sally", species: "mouse", trainer_id: 2)
      monster.attack(m2)
      expect(monster.energy).to eq(70)
    end

    it "causes another monster to lose 10 health from an .attack" do
      m2 = Monster.new(name: "sally", species: "mouse", trainer_id: 2)
      monster.attack(m2)
      expect(monster.energy).to eq(70)
    end

  end

# int "can be created when a name, species, and trainer set" do
# trainer = Trainer.new
# trainer.password = "kickhash"
# trainer.password_confirmaiton = "kickhash"
# trainer.email = me@jonl.org
# trainer.save

# monster = Monster.new
# monster.trainer = trainer
# monster.name = "jon"
# monster.species = "Pikachu"
# expect(monster.save).to be_true
# end 
  it "will concurrently destroy monsters with trainers" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmaiton = "kickhash"
    trainer.email = me@jonl.org
    trainer.save

    monster = Monster.new
    monster.trainer = trainer
    monster.name = "jon"
    monster.species = "Pikachu"
    monster.save
    trainer.destroy
    expect(Monster.exists?(monster.id)).to be_false
  end

end
