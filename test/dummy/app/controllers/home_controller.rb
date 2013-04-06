class HomeController < ApplicationController
  
  include MyAuth
  def index
    @res = MyAuth::Foundation.controller
    @yml = YAML.load_file(File.dirname(__FILE__) + '/../../config/cook.yml')
    @a = a
  end
  
end
