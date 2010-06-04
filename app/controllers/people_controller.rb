class PeopleController < ApplicationController
  def all
    @people = Person.all
  end

  def map
    
  end

  def geocode
    @people = Person.find()
  end
end
