require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "Bangalore is default location" do
    assert Location.new(:lat => 12.971606, :lng => 77.594376).is_default?
    assert Location::BANGALORE.is_default?

    assert Location.new(:lat => 1.971606, :lng => 77.594376).is_default? == false
    assert Location.new(:lat => 12.971606, :lng => 7.594376).is_default? == false
  end
end
