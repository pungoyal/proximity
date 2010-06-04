class Person < ActiveRecord::Base
  has_one :address

  named_scope :not_geocoded, :joins => :address, :conditions => {:addresses => {:lat => nil, :lng => nil}}

  def gender
    return "F" if female
    return "M"
  end

  def printed_address
    return "-NA-" if address.nil?
    return address.to_s
  end

  def geocoded
    return "No" if address.nil?
    return address.geocoded? ? "Yes" : "No"
  end
end
