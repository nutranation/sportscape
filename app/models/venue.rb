class Venue < ActiveRecord::Base
  belongs_to :sport
  attr_accessible :name, :description, :address, :city, :state, :zip_code, :latitude, :longitude
  has_many :check_ins
  geocoded_by :full_street_address
  after_validation :geocode
  
  
  def check_in_total(date, start_hour)
    minus_one=start_hour-1
    CheckIn.where("venue_id = ? and type='check-in' and date=? and (hour_start=? or hour_start=?)", self.id, date, start_hour, minus_one).size
  end
  def commitment_total(date, start_hour, end_hour)
    CheckIn.where("venue_id = ? and type='commitment' and date=? and (hour_start >= ? and hour_start <= ?)", self.id, date, start_hour, end_hour).size
  end
  def check_in_last()
    if CheckIn.where("venue_id=?", self.id).size >0
      
      CheckIn.where("venue_id=?", self.id).last.created_at.in_time_zone('Eastern Time (US & Canada)')
    else
      "None"
    end
  end
  
  def full_street_address
    "#{address} #{city}, #{state}"
  end
end