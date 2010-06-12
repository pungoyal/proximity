require '../../test_helper'

describe MapsApi  do
  it "should get lat and long from google maps api" do
    request = MapsApi::MapsRequest.new
    location = request.geocode "Janak Puri, New Delhi"
    p location
  end
end