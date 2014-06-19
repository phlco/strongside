require_relative 'spec_helper'
require_relative '../lib/mailitem'
require_relative '../lib/package'
require_relative '../lib/postcard'
require_relative '../lib/mailbox'

describe Mailbox do

  it "should have an array of items" do
    mailbox = Mailbox.new
    expect(mailbox.items.length).to be > 0
  end

  it "should be able to accept mail a postcard or package and place it in the Mailitem array" do
    mailbox = Mailbox.new
    postcard = PostCard.new
    mailbox.accept_mail(postcard)
    expect(mailbox.items.last).to be_instance_of(PostCard)
    package = Package.new
    mailbox.accept_mail(package)
    expect(mailbox.items.last).to be_instance_of(Package)
  end

  it "should use the open_mail method to return the first item in the Mailitem array" do
    mailbox = Mailbox.new
    postcard = PostCard.new
    mailbox.accept_mail(postcard)
    expect(mailbox.open_mail).to eq(mailbox.items.first)
  end

  it "should return the specific number of postcards and the specific number of packages in the Mailitem array" do
    mailbox = Mailbox.new
    16.times do
      postcard = PostCard.new
      mailbox.accept_mail(postcard)
    end
    3.times do
      package = Package.new
      mailbox.accept_mail(package)
    end
    expect(mailbox.to_s).to eq("The mailbox has 16 postcards and 3 packages.")
  end
end

# require_relative 'spec_helper'
# require_relative '../lib/mailitem'
# require_relative '../lib/package'
# require_relative '../lib/postcard'
# require_relative '../lib/mailbox'

# describe Mailbox do

#   it "should have an array of items" do
#     mailbox = Mailbox.new
#     expect(mailbox.items.length).to be > 0
#   end

#   context "should be able to accept mail" do
#     it "should accept a postcard or package" do
#       mailbox = Mailbox.new
#       postcard = PostCard.new
#       mailbox.accept_mail(postcard)
#       expect(mailbox.items.last).to be_instance_of(PostCard)
#       package = Package.new
#       mailbox.accept_mail(package)
#       expect(mailbox.items.last).to be_instance_of(Package)
#     end
#     # it "should place the mail in the Mailbox's array of Mailitem objects" do
#     #   mailbox = Mailbox.new
#     #   postcard = PostCard.new
#     #   expect (mailbox.accept_mail(postcard)).to eq(mailbox_items.length + 1)
#     # end
#   end

# end
