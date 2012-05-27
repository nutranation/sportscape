class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      unless user.facebook_id
        user.facebook_id = data["id"] 
        user.save
      end
      user
    elsif data["email"]  && data["name"] # Create a user with a stub password. 
      User.create(:email => data["email"], :password => Devise.friendly_token[0,20], :name => data["name"], :facebook_id => data["id"]) 
    else
      redirect_to new_user_registration_url
    end
  end
end
