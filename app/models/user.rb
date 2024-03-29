class User < ActiveRecord::Base
   
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:is_active

  has_many :pictures, :as => :imageable
  
  def active_for_authentication? 
  super && is_active? 
end 

def inactive_message 
  if !is_active? 
    :not_approved 
  else 
    super # Use whatever other message 
  end 
end

   
  # attr_accessible :title, :body
end
