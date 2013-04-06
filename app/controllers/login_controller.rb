class LoginController < MyAuth::BaseController
  
  
  def authorize
    @p = self.class.home_page_addr
    if Env::get(:user) != nil
      if self.class.home_page_addr != request.fullpath
        goto_home
      end
    else
      @user = BaseUser.new
    end
  end
  
  def login
    user = @model.login(params[:user])
    if user
      Env::set(:user, user)
      goto_home
    else
      redirect_to :back
    end
  end
  
  def unlogin
    @model.unlogin
    check
  end
  
  private
  
  def goto_home
    redirect_to self.class.home_page_addr
  end
  
  def home
    
  end
  
end
