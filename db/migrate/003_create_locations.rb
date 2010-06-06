class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.decimal :lat, :scale => 3, :precision => 15
      t.decimal :lng, :scale => 3, :precision => 15
      t.boolean :exact, :default => false
      t.integer :address_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
