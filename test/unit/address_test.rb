require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "address belongs to a person" do
    person = Person.create!
    address = Address.create!

    address.person = person
    address.save!

    address = Address.first
    address.person = person
  end
end
