Rails.application.routes.draw do
  #post 'login', :controller => :public, :action => :login
  #get 'unlogin', :controller => :public, :action => :unlogin

  get "authorize", :controller => :login, :action => :authorize

  match 'registration', :controller => :registration, :action => :index
  post 'register', :controller => :registration, :action => :register  
  match ':action', :controller => :login, :action => :action
  get MyAuth::PublicController.home_page_addr, :controller => :public, :action => :home
  
end