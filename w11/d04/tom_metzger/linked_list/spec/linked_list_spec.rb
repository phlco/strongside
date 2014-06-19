require "spec_helper"
require_relative "../lib/linked_list"

describe LinkedList do

  describe "#to_a" do
    let(:ll) do
      ll = LinkedList.new
      ll.unshift("C")
      ll.unshift("B")
      ll.unshift("A")
      ll
    end

    it "returns an array conatining A, B, C" do
      expect(ll.to_a)_to eq(["A", "B", "C"])
    end
  end



  let(:A) { "A" }
  let(:B) { "B" }
  let(:C) { "C" }

  context("when the list is empty") do
    let(:ll) { LinkedList.new }

    describe '#unshift' do
      it "adds a new element" do
        ll.unshift(A)
        expect(ll.root).to be(A)
      end

    end

  context "when the list has 1 element in it" do 

    before(:each) do
      ll.unshift(A)
    end

    it "adds the new node as the root" do 
      ll.unshift(B)
      expect(ll.root.value).to eq("B")
    end

  end

    describe '#shift'
    describe '#push'
    describe '#pop'

    describe '#fetch'
    describe '#delete_at'

  end

  describe '#unshift' do
  describe '#shift'
  describe '#push'
  describe '#pop'

  describe '#fetch'
  describe '#delete_at'

end
