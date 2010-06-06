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
    to_geocode = params[:id]
    Address.find(to_geocode).geocode
    redirect_to :action => :index
  end

  def geocode_all
    Address.all.each { |address| address.geocode }
    redirect_to :action => :map
  end
end
