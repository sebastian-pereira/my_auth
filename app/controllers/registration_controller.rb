class RegistrationController < MyAuth::BaseController
  
  def index
    if params[:user]
      @user_register = BaseUser.new(params[:user])
      @user_register.gen_hash
      if @user_register.save
        @user_register.password = @user_register.password_confirmation = hash_string(@user_register.password)
        if @user_register.save
          flash[:notice] = 'You are successfully registered.'
          render :register
        end
      end
    else
      @user_register = User.new
    end
  end
  
  def register
    
  end
  
  private
  
  def hash_string(str)
    Digest::MD5.hexdigest(str)
  end
  
end