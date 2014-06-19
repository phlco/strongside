require_relative 'spec_helper'
require_relative  '../lib/school'

  describe School do
    it "has a name" do
      school = School.new(name: 'Hippy Dippy School')
      expect(school.name).to eq 'Hippy Dippy School'
    end

    it "has no students in database" do
      school = School.new
      expect(school.db).to eq nil?
  end

    it "has a student in database" do
      school = School.new
      school.add("James", 2)
      expect(school.db).to eq({2=> ["James"]})
    end
end

