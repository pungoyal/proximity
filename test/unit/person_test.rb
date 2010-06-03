require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "dude is not a female" do
    assert people(:dude).female == false
  end

  test "person has an address" do
    person = Person.create!
    address = Address.create!

    person.address = address
    person.save!

    person = Person.first
    person.address = address
  end
end
