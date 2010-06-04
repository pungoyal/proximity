class PeopleController < ApplicationController
  def all
    @people = Person.all
  end

  def map

  end

  def geocode
    uncoded = Address.not_geocoded
    uncoded.each { |address| address.geocode }
  end
end
