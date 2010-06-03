class AssociatePersonAndAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :person_id, :integer
  end

  def self.down
    remove_column :addresses, :person_id
  end
end
