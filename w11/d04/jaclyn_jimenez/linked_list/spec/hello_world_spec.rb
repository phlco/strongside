require "spec_helper"
require_relative "../lib/hello_world"

describe 'hello_world' do

  it "returns 'hello world'" do
    expect(hello_world).to eq("hello world")
  end

end
