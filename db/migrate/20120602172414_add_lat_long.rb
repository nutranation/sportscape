class AddLatLong < ActiveRecord::Migration
  def up
    add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float
    ActiveRecord::Base.connection.execute("truncate venues")
    
    v=Sport.find 2
    b= Sport.find 1
    
    v1=Venue.create(:name=>"Volleyball-1", :address=>"V1", :address => "853 Main Street", :city => "Cambridge", :state => "MA")
    v1.sport=v
    
    v2=Venue.create(:name=>"Volleyball-2", :address=>"V2", :address => "89 Winthrop Street", :city => "Cambridge", :state => "MA")
    v2.sport=v
    
    v3=Venue.create(:name=>"Volleyball-3", :address=>"V3", :address => "9 Sanborn Cour", :city => "Somerville", :state => "MA")
    v3.sport=v
    
    
    b1=Venue.create(:name=>"Basketball-1", :address=>"B1",:address => "156 Cambridge Street", :city => "Boston", :state => "MA")
    b1.sport=b
    
    b2=Venue.create(:name=>"Basketball-2", :address=>"B2", :address => "621 Cambridge Street", :city => "Cambridge", :state => "MA")
    b2.sport=b
    
    b3=Venue.create(:name=>"Basketball-3", :address=>"B3", :address => "280 Palace Rd", :city => "Boston", :state => "MA")
    b3.sport=b
    
    b1.save!
    v1.save!
    b2.save!
    v2.save!
    b3.save!
    v3.save!
  end

  def down
  end
end
