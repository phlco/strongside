require 'spec_helper'

describe Lamb do
  it ".new" do
    lamb = Lamb.new
    expect(lamb.is_silent).to be_true
  end
end
