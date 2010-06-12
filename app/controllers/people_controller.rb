class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def all
    people = {}
    Person.all.each do |person|
      next if !person.address.geocoded?

      marker = {}
      marker["name"] = person.name
      marker["lat"] = person.address.location.lat
      marker["lng"] = person.address.location.lng

      people[person.ps_id] = marker
    end

    offices = {}
    Office.all.each do |office|
      marker = {}
      marker["name"] = office.name
      marker["lat"] = office.location.lat
      marker["lng"] = office.location.lng
      offices[office.id] = marker
    end

    result = {}
    result["people"] = people
    result["offices"] = offices

    p result.to_json
    render :json => result.to_json
  end

  def map
    @offices = Office.all
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
