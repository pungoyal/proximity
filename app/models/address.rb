class Address < ActiveRecord::Base
  belongs_to :person

  def to_s
    return (line1.to_s + ", " + line2.to_s + ", " + area.to_s + ", " + city.to_s + ", " + state.to_s + ", " + postcode.to_s).gsub(/ ,/, '')
  end

  def geocoded?
    return (!lat.nil? and !lng.nil?)
  end
end
