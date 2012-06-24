require 'spec_helper'

describe Status do
  it { should validate_presence_of(:message) }
  it { should belong_to(:user) }
  it { should allow_mass_assignment_of(:message) }
  it { should_not allow_mass_assignment_of(:user_id) }
end
