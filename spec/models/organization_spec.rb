require 'spec_helper'

describe Organization do
  it { should validate_presence_of(:name) }
  it { should have_and_belong_to_many(:users) }
  it { should allow_mass_assignment_of(:name) }
end
