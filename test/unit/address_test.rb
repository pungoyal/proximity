require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "get location from google" do
    a = Address.new :line2 => "S T Bed Layout", :area => "Koramangala 4th Block", :city => "Bangalore", :state => "Karnataka"
    a.geocode
    assert a.location.is_default? == false

    a = Address.new :area => "Koramangala 4th Block", :city => "Bangalore", :state => "Karnataka"
    a.geocode
    assert a.location.is_default? == false
  end

  test "bad address maps to Bangalore default location" do
    a = Address.new :line1 => "A 4, 704,", :line2 => "Lunkad Amazon, Nr Symbosis Int. School",
                    :area => "Viman Nagar", :city => "Bangalore", :state => "Maharashtra"
    a.geocode
    assert a.location.is_default?
    assert_equal false, a.location.exact
  end

  test "mark approximate locations" do
    a = Address.new :line1 => "S T Bed Layout", :area => "Koramangala 4th Block", :city => "Bangalore", :state => "Karnataka"
    a.geocode
    assert_equal false, a.location.exact

    a = Address.new :line1 => "200 E Randolph Street", :city => "Chicago", :state => "IL"
    a.geocode
    assert_equal true, a.location.exact
  end

  test "does not retry geocoding indefinitely" do
    a = Address.create! :city => "Bangalore", :state => "Karnataka"
    a.geocode
    assert a.geocoded?
    assert a.location.is_default?
  end

  test "formats the address nicely" do
    address = Address.new :line2 => "S T Bed Layout", :area => "Koramangala 4th Block", :city => "Bangalore", :state => "Karnataka", :postcode => 560013
    assert_equal "S T Bed Layout, Koramangala 4th Block, Bangalore, 560013, Karnataka", address.to_s

    address = Address.new :line1 => "S T Bed Layout", :area => "Koramangala 4th Block", :city => "Bangalore", :state => "Karnataka"
    assert_equal "S T Bed Layout, Koramangala 4th Block, Bangalore, Karnataka", address.to_s

    address = Address.new :city => "Bangalore", :state => "Karnataka"
    assert_equal "Bangalore, Karnataka", address.to_s

    address = Address.new
    assert_equal "", address.to_s
  end


  test "address is not geocoded if location is nil" do
    a = Address.new :city => "Bangalore", :state => "Karnataka"
    assert_equal false, a.geocoded?
  end

  test "address is geocoded if there is an associated location" do
    a = Address.new :city => "Bangalore", :state => "Karnataka", :location => Location.new
    assert_equal true, a.geocoded?
  end
end
