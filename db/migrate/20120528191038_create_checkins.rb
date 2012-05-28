class CreateCheckins < ActiveRecord::Migration
  def up
    create_table :check_ins do |t|
      t.integer :venue_id
      t.integer :user_id
      t.string :type
      t.string :date
      t.integer :hour_start
      t.integer :hour_end
      
      t.timestamps
    end
  end

  def down
    drop_table :check_ins
  end
end
