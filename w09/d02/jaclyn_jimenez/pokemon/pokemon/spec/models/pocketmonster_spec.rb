require 'spec_helper'

describe Pocketmonster do

  let(:ash) do
    Trainer.create(
      {
        name: "ash",
        email: "ash@gmail.com",
        password: "ketchum",
        password_confirmation: "ketchum"
      }
    )
  end

  let(:pika) { Pocketmonster.new }


  it "should only be valid if it has a name" do
    # pika.species = 'pikachu'
    # pika.trainer_id = 1
    # expect(pika.save).to be_false
    pika.valid?
    expect(pika.errors).to have_key(:name)
  end
  it "should only be created if it has a species" do
    # pika = Pocketmonster.new
    # pika.name = 'pikachu'
    # pika.trainer_id = 1
    # expect(pika.save).to be_false
    pika.valid?
    expect(pika.errors).to have_key(:species)
  end

  context "when newly created" do
    let(:pika) do
      Pocketmonster.create({
        name: "pikachu",
        species: "pikachu"})
    end

    it "should have a health of 80 when created" do
      expect(pika.health).to eq(40)
    end

    it "should have a health of 80 when created" do
      expect(pika.energy).to eq(20)
    end
    it "must belong to a trainer, unlike in the real game" do
      expect(pika.save).to be_false
    end

    it "is destroyed if the trainer is destroyed, unlike in the real game" do
      pika.trainer = ash
      ash.destroy
      expect(pika).to_not be
    end
  end

end
