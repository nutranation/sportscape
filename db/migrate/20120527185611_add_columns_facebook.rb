class AddColumnsFacebook < ActiveRecord::Migration
  def up
    add_column :users, :facebook_id, :string
    add_index :users, :facebook_id,          :unique => true
  end

  def down
  end
end
