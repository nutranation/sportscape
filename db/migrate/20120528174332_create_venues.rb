class CreateVenues < ActiveRecord::Migration
  def up
    create_table :sports do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :sport_id
      t.string :description
      t.timestamps
    end
    b=Sport.create(:name =>"Basketball")
    b.save!
    v=Sport.create(:name =>"Volleyball")
    v.save!
    
    v1=Venue.create(:name=>"Volleyball-1", :address=>"V1", :city => "Cambridge", :state => "MA")
    v1.sport=v
    
    v2=Venue.create(:name=>"Volleyball-2", :address=>"V2", :city => "Cambridge", :state => "MA")
    v2.sport=v
    
    v3=Venue.create(:name=>"Volleyball-3", :address=>"V3", :city => "Cambridge", :state => "MA")
    v3.sport=v
    
    
    b1=Venue.create(:name=>"Basketball-1", :address=>"B1", :city => "Cambridge", :state => "MA")
    b1.sport=b
    
    b2=Venue.create(:name=>"Basketball-2", :address=>"B2", :city => "Cambridge", :state => "MA")
    b2.sport=b
    
    b3=Venue.create(:name=>"Basketball-3", :address=>"B3", :city => "Cambridge", :state => "MA")
    b3.sport=b
    
    b1.save!
    v1.save!
    b2.save!
    v2.save!
    b3.save!
    v3.save!
  end

  def down
    drop_table :venues
    drop_table :sports
  end
end
