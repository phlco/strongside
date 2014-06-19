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

  end

end
