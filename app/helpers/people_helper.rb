module PeopleHelper
  def yes_or_geocode address
    return "Yes" if address.geocoded?
    link_to "No", geocode_url(address.id)
  end
end
