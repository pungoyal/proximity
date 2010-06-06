class RemoveLatLngFromAddress < ActiveRecord::Migration
  def self.up
    remove_column :addresses, :lat
    remove_column :addresses, :lng
  end

  def self.down
    add_column :addresses, :lng, :decimal
    add_column :addresses, :lat, :decimal
  end
end
