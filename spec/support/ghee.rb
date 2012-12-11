RSpec.configure do |config|
  config.before(:each) do
    Ghee.any_instance.stub(:orgs).and_return([ {'login' => 'Acme Labs'}])
  end
end
