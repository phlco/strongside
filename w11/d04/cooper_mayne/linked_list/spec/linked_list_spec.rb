require "spec_helper"
require_relative "../lib/linked_list"

describe LinkedList do

  describe '#to_a' do

    let(:ll) do
      ll = LinkedList.new
      ll.unshift("C")
      ll.unshift("B")
      ll.unshift("A")

      ll
    end

    it "return an array containing all its elements " do
      expect(ll.to_a).to eq(["A", "B", "C"])
    end

  end

  describe '#unshift' do

    context "when a list is empty" do

      it "adds the new node as the root" do
        ll = LinkedList.new
        ll.unshift("A")
        expect(ll.root.value).to eq("A")
      end

    end

    context "when a list has 1 element in it" do

      before(:each) do
        @ll = LinkedList.new
        @ll.unshift("A")
      end

      it "adds the new node as the root" do
        @ll.unshift("B")
        expect(@ll.root.value).to eq("B")
      end

      it "the previous element is still there" do
        @ll.unshift("B")
        nxt = @ll.root.next

        expect(nxt.value).to eq("A")
      end

    end

  end

  describe '#each' do
    let(:ll) do
      ll = LinkedList.new
      ll.unshift("C")
      ll.unshift("B")
      ll.unshift("A")

      ll
    end

    it "should yield to block for each element in the list" do
      answer = []
      ll.each { |item| answer << item + "s" }
      expect(answer).to eq(["As", "Bs", "Cs"])
    end
  end

end
