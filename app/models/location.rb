class Location < ActiveRecord::Base
  BANGALORE = Location.new(:lat => 12.971606, :lng => 77.594376)

  def to_s
    "lat: " + lat.to_s + "; lng: " + lng.to_s
  end

  def is_default?
    is?(BANGALORE)
  end

  def is?(location)
    lat == location.lat and lng == location.lng
  end

  def geocoded?
    (!lat.nil? and !lng.nil?)
  end
end
