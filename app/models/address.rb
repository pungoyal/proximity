class Address < ActiveRecord::Base
  belongs_to :person

  def to_s
    return line1 + ", " + line2 + ", " + area + ", " + city + ", " + state + ", " + postcode 
  end
end
