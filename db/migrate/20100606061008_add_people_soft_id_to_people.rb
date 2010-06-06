class AddPeopleSoftIdToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :ps_id, :integer
  end

  def self.down
    remove_column :people, :ps_id 
  end
end
