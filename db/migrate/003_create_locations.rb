class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :lat
      t.string :lng
      t.boolean :exact, :default => false
      t.integer :address_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
