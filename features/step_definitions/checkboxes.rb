# Try running with the checkbox  ":id", ":name", ":value", ":index" or ":class" element attribute.
# Does not matter what you select!
# The proper watir code will be executed regardless.

Given /I click the "(.*)" checkbox/ do |type|
  if @browser.checkbox(:id, type).exists? then
     @browser.checkbox(:id, type).click
  
  elsif @browser.checkbox(:name, type).exists? then
        @browser.checkbox(:name, type).click
  
  elsif @browser.checkbox(:value, type).exists? then
        @browser.checkbox(:value, type).click
  
  elsif @browser.checkbox(:index, type).exists? then
        @browser.checkbox(:index, type).click

  elsif @browser.checkbox(:class, /(^|\s)#{type}(\s|$)/).exists? then
        @browser.checkbox(:class, /(^|\s)#{type}(\s|$)/).set(text)
  else
    fail("could not find what you asked for")
  end
end