module MyAuth
  class PublicController < ActionController::Base
    
    layout 'public'
    protected
    def self.home_page_addr
      '/id'
    end
  end
end