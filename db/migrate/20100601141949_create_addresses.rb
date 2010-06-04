class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :area
      t.string :city
      t.string :state
      t.integer :postcode
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
