Feature: Geocode user address
  In order to see the location the map
  As a user
  I want to be able to geocode an address

  Scenario: Geocode a single user
    Given I open the people page
    When I click on No for "Puneet"
    Then I should be see that "Puneet" is geocoded 