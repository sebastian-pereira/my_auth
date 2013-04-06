class BaseUser < ActiveRecord::Base
  set_table_name :users
  
  attr_accessible :name, :surname, :email, :active, :password, :avatar, :password_confirmation
  
  validates_confirmation_of :password
  validates :name, :surname, :presence => true, :length => {:minimum => 3, :maximum => 30}
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :length => {:minimum => 6}
  validates_format_of :email,:with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  
  def gen_hash
    self.user_hash = Digest::MD5.hexdigest(rand(100000000).to_s)
  end
  
  def is_defined?
    #self && self.id
  end
  
end