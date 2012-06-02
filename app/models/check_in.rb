class CheckIn < ActiveRecord::Base
   belongs_to :venue
   belongs_to :user
   attr_accessible :type, :date, :hour_start, :hour_end, :venue_id, :user_id, :court_state, :public
   set_inheritance_column :ruby_type
end