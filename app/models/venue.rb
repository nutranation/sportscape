class Venue < ActiveRecord::Base
  belongs_to :sport
  attr_accessible :name, :description, :address, :city, :state, :zip_code
  has_many :check_ins
  
  def check_in_total(date, start_hour)
    minus_one=start_hour-1
    CheckIn.where("venue_id = ? and type='check-in' and date=? and (hour_start=? or hour_start=?)", self.id, date, start_hour, minus_one).size
  end
  def commitment_total(date, start_hour, end_hour)
    CheckIn.where("venue_id = ? and type='commitment' and date=? and (hour_start >= ? and hour_start <= ?)", self.id, date, start_hour, end_hour).size
  end
  
end