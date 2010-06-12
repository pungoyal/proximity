class Address < ActiveRecord::Base
  include MapsApi

  belongs_to :person
  belongs_to :location, :dependent => :destroy

  def to_s
    [line1, line2, area, city, postcode, state].compact.join(", ")
  end

  def geocoded?
    !location.nil?
  end

  def geocode
    return if geocoded?

    google_maps = MapsApi::MapsRequest.new
    to_search = [line1, line2, area, city].compact
    location = google_maps.geocode(to_search.join(','))

    while !location.nil? and location.is_default? and to_search.count>1 do
      to_search.shift
      location = google_maps.geocode(to_search.join(','))
      location.exact = false
    end

    self.location = location.nil? ? Location::BANGALORE : location
    save!
  end
end