require 'spec_helper'

describe Monster do

  it {should have_db_column(:name).of_type(:string)}

  it {should have_db_column(:species).of_type(:string)}

  it {should have_db_column(:health).of_type(:integer).with_options(:default => 80)}

  it {should have_db_column(:energy).of_type(:integer).with_options(:default => 80)}

  it {should have_db_column(:trainer_id).of_type(:integer)}

  it {should validate_presence_of(:name)}

  it {should belong_to(:trainer)}

  it {should validate_presence_of(:trainer_id)}


end
