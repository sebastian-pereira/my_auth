module MyAuth
  class Login < Auth

    def initialize
      @a = 1
    end

    def check_authorization
      Env::get(:user) != nil ? true : false
    end
    
    def login(params)
      user = BaseUser.where(:active => true).where(:email => params[:email]).where(:password => Digest::MD5.hexdigest(params[:password])).first
      user ||= false
    end
    
    def unlogin
      Env::set('user', nil)
    end
    
  end
end