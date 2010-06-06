class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer :ps_id
      t.string :name
      t.boolean :female

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
