require 'rubygems'
require 'wrest'

module MapsApi
  class MapsRequest
    @@geocode_url = "http://maps.google.com/maps/api/geocode/json"
    @@directions_url = "http://maps.google.com/maps/api/directions/json"
    @@sensor = false

    def geocode address
      uri = @@geocode_url.to_uri
      maps_data = uri.get(:sensor => @@sensor, :address => address).deserialise
      response = GeocodeResponse.new maps_data

      return Location.new :lat => response.lat, :lng => response.lng, :exact => true if response.good?
      return Location.new :exact => true
    end

    def distance from, to
      uri = @@directions_url.to_uri
      maps_data = uri.get(:sensor => @@sensor, :origin => from, :destination => to).deserialise
      response = DirectionsResponse.new maps_data
      return response.distance
    end
  end

  class MapsResponse
    @@good = "OK"
    @@bad = "ZERO_RESULTS"

    def initialize result
      @status = result["status"]
    end

    def good?
      @status == @@good
    end
  end

  class GeocodeResponse < MapsResponse
    def initialize result
      super(result)
      @result = result["results"][0]
    end

    def lat
      location["lat"]
    end

    def lng
      location["lng"]
    end

    private
    def location
      @result["geometry"]["location"]
    end
  end

  class DirectionsResponse < MapsResponse
    def initialize result
      super(result)
      @result = result["routes"][0]["legs"][0]
    end

    def distance
      @result["distance"]
    end

    def end_location
      @result["end_location"]
    end
  end
end