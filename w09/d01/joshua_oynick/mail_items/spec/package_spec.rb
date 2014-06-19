require_relative 'spec_helper'
require_relative '../lib/postcard'
require_relative '../lib/mailitem'
require_relative '../lib/package'

describe Package do

  before(:each) do
    @package = Package.new
  end

  it "inherits MailItem" do
    expect(Package.superclass).to eq(Mailitem)
  end

  it "has a content array" do
    # package = Package.new
    expect(@package.content.is_a?(Array)).to eq(true)
  end

  it 'returns true if fragile' do
    expect(@package.is_fragile).to eq false
  end

  it 'returns true if it is broken' do
    expect(@package.is_broken).to eq false
  end

  it 'responds to shaking' do
    expect(@package).to respond_to :shake
  end

  it 'will be broken if it is fragile and is shaken' do
    @package.is_fragile = true
    @package.shake
    expect(@package.is_broken).to eq true
  end

  it 'responds to is_broken?' do
    expect(@package).to respond_to(:is_broken?)
  end




end
