# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
address = Address.create! :line1 => "200 E Randolph Street", :line2 => "Floor 25th", :city => "Chicago", :state => "IL", :postcode => 60601, :lat => 41.8839532, :lng => 87.6223402
Person.create! :name => "Puneet Goyal", :female => false, :address => address

address = Address.create! :line1 => "B1A/20A", :line2 => "Janak Puri", :city => "New Delhi", :state => "Delhi", :postcode => 110058
Person.create! :name => "Rahul Goyal", :female => false, :address => address
