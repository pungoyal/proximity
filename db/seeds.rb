# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
address = Address.create! :line1 => "200 E Randolph Street", :line2 => "Floor 25th", :city => "Chicago", :state => "IL", :postcode => 60601
Person.create! :name => "Puneet Goyal", :female => false, :address => address