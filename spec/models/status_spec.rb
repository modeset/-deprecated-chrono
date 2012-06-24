require 'spec_helper'

describe Status do
  it { should belong_to(:user) }
  it { should allow_mass_assignment_of(:message) }
  it { should allow_mass_assignment_of(:is_clock_out) }
  it { should_not allow_mass_assignment_of(:user_id) }
end
