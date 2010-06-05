class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def map

  end

  def show
    @person = Person.find params[:id]
  end

  def geocode
    Address.not_geocoded.each { |address| address.geocode }
    redirect_to :action => :map
  end
end
