module MyAuth
  class BaseController < PublicController
    before_filter :before
    before_filter :check, :except => [:unlogin, :login]
    private
    
    def before
      @model = MyAuth::Login.new
    end 
    
    
    def check
      authorized = @model.check_authorization
      unless authorized
        unless (action_name == 'authorize' and controller_name == 'login') or (action_name == 'index' and controller_name == 'registration') or (action_name == 'register' and controller_name == 'registration')
          redirect_to :controller => :login, :action => :authorize
        end
      else
        if action_name == 'index' and controller_name == 'registration'
          redirect_to :back
        end
      end
    end
  end
end