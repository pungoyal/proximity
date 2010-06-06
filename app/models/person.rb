class Person < ActiveRecord::Base
  has_one :address

  def gender
    return "F" if female
    return "M"
  end

  def printed_address
    return "-NA-" if address.nil?
    return address.to_s
  end

  def geocoded
    return address.geocoded? ? "Yes" : "No"
  end
end
