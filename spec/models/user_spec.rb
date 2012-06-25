require 'spec_helper'

describe User do
  it { should have_many(:statuses).dependent(:destroy) }
  it { should have_and_belong_to_many(:organizations) }
end
