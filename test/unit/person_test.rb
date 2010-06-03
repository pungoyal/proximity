require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "dude is not a female" do
    assert people(:dude).female == false
  end
end
