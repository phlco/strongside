# require "spec_helper"
# require_relative "../lib/bst"

# describe BST do

#   # describe '#next'

#   describe '#add' do

#     let(:bst) { BST.new }

#     it "add a node to the tree" do
#       bst.add(3)
#       expect(bst.root.value).to eq(3)
#     end

#     it "adds a larger node to the right" do
#       bst.add(3)
#       bst.add(6)
#       expect(bst.root.value).to eq(3)
#       expect(bst.root.right.value).to eq(6)
#     end

#     it "adds a smaller node to the left" do
#       bst.add(7)
#       bst.add(3)
#       expect(bst.root.value).to eq(7)
#       expect(bst.root.left.value).to eq(3)
#     end

#   end

#   # describe '#remove'

#   # describe '#find'

# end
