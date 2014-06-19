require 'spec_helper'

describe Machine do
  let(:machine) { Machine.new }

  context ".new" do
    it { should validate_presence_of(:candy) }
    it { should validate_presence_of(:money) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:price) }
  end
end
