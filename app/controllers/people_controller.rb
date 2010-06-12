class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def all
    result = {}

    Person.all.each do |person|
      next if !person.address.geocoded?

      marker = {}
      marker["name"] = person.name
      marker["lat"] = person.address.location.lat
      marker["lng"] = person.address.location.lng

      result[person.ps_id] = marker
    end

    render :json => result.to_json
  end

  def map
  end

  def show
    @person = Person.find params[:id]
  end

#  to go into address controller
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
