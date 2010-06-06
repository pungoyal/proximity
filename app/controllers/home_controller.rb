require 'fastercsv'

class HomeController < ApplicationController
  def home

  end

  def parse
    csv = params[:csv]
    FasterCSV.parse(csv, :headers => false) do |row|
      next if row.blank?
      person = Person.new :ps_id => row[0], :name => row[1], :female => (row[2] == 'F')
      address = Address.new :line1 => row[3], :line2 => row[4], :area => row[5], :city => row[6], :state => row[7], :postcode => row[8]
      person.address = address
      person.save!
    end

    redirect_to :controller => :people, :action => :index    
  end
end
