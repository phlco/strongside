require "spec_helper"
require_relative "../lib/recursion"

describe "Recursive Methods" do


  describe 'fib' do

    it "0 should be 0"
    it "1 should be 1"
    it "5 should be 5"


  end

  describe 'sum' do

    it "0 should be 0" do
      debugger
      expect(sum(0)).to eq(0)
    end

    it "1 should be 1" do
      expect(sum(1)).to eq(1)
    end

    it "2 should be 3" do
      expect(sum(2)).to eq(3)
    end

    it "3 should be 6" do
      expect(sum(3)).to eq(6)
    end

    it "1000 should be 500500" do
      expect(sum(1000)).to eq(500500)
    end


  end

end
