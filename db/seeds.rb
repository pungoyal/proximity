# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

location = Location.create! :lat => '12.958886129203817', :lng => '77.64345449829102', :exact => true
Office.create! :name => 'Bangalore One', :location => location

location = Location.create! :lat => '12.92885064885335', :lng => '77.62857896709443', :exact => true
Office.create! :name => 'Bangalore Two', :location => location

address = Address.create! :line1 => "B1A/20A", :area => 'Janak Puri', :city => "New Delhi", :state => "Delhi"
Person.create! :ps_id => 11116, :name => "Puneet", :female => false, :address => address
