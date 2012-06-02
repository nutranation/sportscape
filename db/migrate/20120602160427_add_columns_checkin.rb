class AddColumnsCheckin < ActiveRecord::Migration
  def up
    add_column :check_ins, :court_state, :string
    add_column :check_ins, :public, :boolean
  end

  def down
  end
end
