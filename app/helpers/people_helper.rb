module PeopleHelper
  def yes_or_geocode address
    return link_to("No", geocode_url(address.id)) if !address.geocoded?
    return "Yes*" if !address.location.exact
    return "Yes"
  end
end
