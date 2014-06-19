require 'spec_helper'

describe Trainer do

  let (:trainer) {Trainer.new}

  it {should have_db_column(:name).of_type(:string)}

  it {should have_db_column(:email).of_type(:string)}

  it {should have_db_column(:password_digest).of_type(:string)}

  it { should validate_presence_of(:name)}

  it { should validate_presence_of(:password_digest) }

  it { should ensure_length_of(:password). is_at_least(6). is_at_most(40)}

  it { should validate_presence_of(:email)}

  it { should validate_uniqueness_of(:email)}

  it { should have_many(:monsters).dependent(:destroy)}
end
