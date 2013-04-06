module MyAuth
  class Auth
=begin    
  
    def self.current
        cookies = Environment.getInstance.controller.cookies
        [:_session_id, :sid, :key].each do |key|
          if cookies[key] == nil
            return nil
          end
        end

        sess = ActiveRecord::Base::Session.where(:session_id => cookies[:sid]).first
        sess = Marshal.restore(Base64.decode64(sess.data))
        if sess["shash"]
          user = ActiveRecord::Base::User.where(:user_hash => sess["shash"]).first
          if user && Digest::MD5.hexdigest(user.email.to_s + Digest::MD5.hexdigest(user.password.to_s)) == cookies[:key]
            return user
          end
        end
    
        nil
      end
=end
    
    
    def check_user_data(params)
      
    end
    
    def init_user(user)
      Env::set('user', user)
    end
  end
end