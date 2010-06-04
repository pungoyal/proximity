require '../../test_helper'


describe GoogleApi do
  it "should get lat and long from google maps api" do
    request = GoogleApi::MapsRequest.new
    response = request.geocode Address.new :area=>"Janak Puri"
  end
end