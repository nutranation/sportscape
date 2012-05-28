class Sport < ActiveRecord::Base
  has_many :venues
  attr_accessible :name, :description
end