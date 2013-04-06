require "active_support/dependencies"

['adapter', 'foundation', 'auth', 'login'].each do |f|
  require 'my_auth/' + f
end
require 'models/base_user'


module MyAuth
  
  # Our host application root path
  # We set this when the engine is initialized
  mattr_accessor :app_root

  # Yield self on setup for nice config blocks
  def self.setup
    yield self
  end
  
  
  def a
    BaseController
  end
end

require "my_auth/engine"

ActionController::Base.send(:include, MyAuth::Base::Adapter::Implementation)