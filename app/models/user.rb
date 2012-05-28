class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :check_ins
  attr_accessible :email, :password, :password_confirmation, :remember_me, :location
  after_create :send_welcome_email
  
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = self.find_by_email(data.email)
      user
    else # Create a user with a stub password. 
      self.create(:email => data.email, :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
  def has_commited(venue, date, start_hour, end_hour)
    if CheckIn.where("user_id = ? and venue_id = ? and type='commitment' and date=? and (hour_start >= ? and hour_start <= ?)", self.id, venue.id, date, start_hour, end_hour).size > 0
      true
    else
      false
    end
  end
  def has_checked_in(venue, date, start_hour)
    minus_one=start_hour-1
    if CheckIn.where("user_id = ? and venue_id = ? and type='check-in' and date=? and (hour_start=? or hour_start=?)", self.id, venue.id, date, start_hour, minus_one).size > 0
      true
    else
      false
    end
  end
end
