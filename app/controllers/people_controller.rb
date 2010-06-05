class PeopleController < ApplicationController
  def all
    @people = Person.all
  end

  def map

  end

  def geocode
    Address.not_geocoded.each { |address| address.geocode }
    redirect_to :action => :all
  end
end
