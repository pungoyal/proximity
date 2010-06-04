class Address < ActiveRecord::Base
  include GoogleApi

  belongs_to :person

  named_scope :not_geocoded, :conditions => {:lat => nil, :lng => nil}

  def to_s
    return (to_search + ", " + postcode.to_s).gsub(/ ,/, '')
  end

  def to_search
    return (line1.to_s + ", " + line2.to_s + ", " + area.to_s + ", " + city.to_s + ", " + state.to_s).gsub(/ ,/, '')
  end

  def geocoded?
    return (!lat.nil? and !lng.nil?)
  end

  def geocode
    maps = GoogleApi::MapsRequest.new
    maps.geocode self
  end
end
