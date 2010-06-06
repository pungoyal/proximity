require 'rubygems'
require 'wrest'

require 'uri'
require 'open-uri'
require 'json'


module GoogleApi
  class MapsRequest
    @@google_maps_url = "http://maps.google.com/maps/api/geocode/json"
    @@sensor = false

    def geocode address
      uri = @@google_maps_url.to_uri
      maps_data = uri.get(:sensor => @@sensor, :address => address)
      response = GoogleApi::MapsResponse.new maps_data.deserialise
      return Location.new :lat => response.lat, :lng => response.lng if response.good?
    end
  end

  class MapsResponse
    @@GOOD = "OK"
    @@BAD = "ZERO_RESULTS"

    def good?
      @status == @@GOOD
    end

    def initialize result
      @status = result["status"]
      @result = result["results"][0]
    end

    def location
      @result["geometry"]["location"]
    end

    def lat
      location["lat"]
    end

    def lng
      location["lng"]
    end
  end
end