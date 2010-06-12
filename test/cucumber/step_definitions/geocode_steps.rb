require 'selenium/client'

Before do
  @verification_errors = []
  @selenium = Selenium::Client::Driver.new(
          :host => "localhost",
          :port => 4444,
          :browser => "*firefox",
          :url => "http://localhost:3000/",
          :timeout => 10000)
  @selenium.start
  @selenium.set_context("Geocode feature")
end

After do |scenario|
  @selenium.stop
  assert_equal [], @verification_errors
end

Given /^I open the people page$/ do
  @selenium.open "/people"
end

When /^I click on No for "([^"]*)"$/ do |name|
  @selenium.click "css=a"
end

Then /^I should be see that "([^"]*)" is geocoded$/ do |name|
  p @selenium.is_text_present("Yes")
end