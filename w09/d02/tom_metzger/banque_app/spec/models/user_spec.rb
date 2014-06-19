require 'spec_helper'

describe User do
  let(:user) do
    User.new
  end

  it "cannot be created without a name" do
    user.valid?
    expect(user.errors).to have_key(:name)
  end

  it "cannot be created without an email" do
    user.valid?
    expect(user.errors).to have_key(:email)
  end

  it "cannot be created without a password" do
    user.valid?
    expect(user.errors).to have_key(:password)
  end

  it "cannot be created without a password digest" do
    user.valid?
    expect(user.errors).to have_key(:password_digest)
  end



end
