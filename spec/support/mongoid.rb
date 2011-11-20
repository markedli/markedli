RSpec.configure do |config|
  config.before :each do
    Mongoid.master.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
  config.include Mongoid::Matchers
end
