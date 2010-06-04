class PeopleController < ApplicationController
  def all
    @people = Person.all
  end

  def map
    
  end
end
