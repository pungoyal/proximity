class Address < ActiveRecord::Base
  include GoogleApi

  belongs_to :person
  has_one :location, :dependent => :destroy

  def to_s
    [line1, line2, area, city, postcode, state].compact.join(", ")
  end

  def geocoded?
    !location.nil?
  end

  def geocode
    return if geocoded?

    google_maps = GoogleApi::MapsRequest.new
    to_search = [line1, line2, area, city, state].compact
    location = google_maps.geocode(to_search.join(','))

    while location.is_default? and to_search.count>1 do
      to_search.shift
      location = google_maps.geocode(to_search.join(','))
      location.exact = false
    end

    self.location = location
    save!
  end
end
