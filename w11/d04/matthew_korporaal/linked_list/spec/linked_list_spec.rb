require "spec_helper"
require_relative "../lib/linked_list"

describe LinkedList do

  describe '#to_a' do

    before(:each) do
      @ll = LinkedList.new
      @ll.unshift("C")
      @ll.unshift("B")
      @ll.unshift("A")
    end

    it "return an array containing 'A', 'B', 'C' " do
      expect(@ll.to_a).to eq(["A", "B", "C"])
    end

  end

  describe '#unshift' do

    context "when a list is empty" do
      it "adds the new node as the root" do
        @ll = LinkedList.new
        @ll.unshift("A")
        expect(@ll.root.value).to eq("A")
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
      it "returns itself" do
        expect(@ll.unshift("B")).to eq(["B","A"])
      end
    end
  end
  describe "#shift" do
    before(:each) do
      @ll = LinkedList.new
      @ll.unshift("A")
    end
    it "should return the root element" do
      @ll.unshift("B")
      expect(@ll.shift).to eq("B")
    end
  end
  describe "#push" do
    before(:each) do
      @ll = LinkedList.new
      @ll.unshift("A")
    end

    it "adds to end of list" do
      expect(@ll.push("B")).to eq(["A","B"])
    end
  end
  describe "#pop" do
    before(:each) do
      @ll = LinkedList.new
      @ll.unshift("C")
      @ll.unshift("B")
      @ll.unshift("A")
    end

    it "return last in the list" do
      expect(@ll.pop).to eq("C")
    end
    it "size is one less after pop" do
      @ll.pop
      expect(@ll.to_a).to eq(["A","B"])
      expect(@ll.to_a.length).to eq(2)
    end
  end

  describe "#fetch" do
    before(:each) do
      @ll = LinkedList.new
      @ll.unshift("C")
      @ll.unshift("B")
      @ll.unshift("A")
    end
    it "returns index of the list" do
      expect(@ll.fetch("B")).to eq(1)
    end
  end

  describe "#insert" do
    before(:each) do
      @ll = LinkedList.new
      @ll.unshift("C")
      @ll.unshift("B")
      @ll.unshift("A")
    end
    it "adds element to the list" do
      @ll.insert("1", 1)
      expect(@ll.to_a).to eq(["A","1","B","C"])
      expect(@ll.length).to eq(4)
    end
  end
end
    # describe '#shift'
    # describe '#push'
    # describe '#pop'

    # describe '#fetch'
    # describe '#delete_at'


  # describe '#unshift' do
  # describe '#shift'
  # describe '#push'
  # describe '#pop'

  # describe '#fetch'
  # describe '#delete_at'


