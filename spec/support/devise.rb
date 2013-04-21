RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllersMacros, :type => :controller
end