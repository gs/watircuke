Given /I "(.*)" the "(.*)" button/ do |action, what|
  what = parse_from_yaml(what) if what.match(":")     
  find_button(action, what) 
end

Given /I "(.*)" the "(.*)" checkbox/ do |action, what|
  what = parse_from_yaml(what) if what.match(":")
  find_checkbox(action, what)
end

Given /I "(.*)" the "(.*)" div/ do |action, what|
  what = parse_from_yaml(what) if what.match(":")
  find_div(action, what)
end

Given /I "(.*)" the "(.*)" image/ do |action, what|
  find_image(action, what)
end

Given /I "(.*)" the "(.*)" link/ do |action, what| 
  what = parse_from_yaml(what) if what.match(":")
  find_link(action, what)
end

Given /I "(.*)" the "(.*)" radio button/ do |action, what|
  what = parse_from_yaml(what) if what.match(":")
  find_radio_button(action, what)
end

Given /I click row "(.*)" in the "(.*)" table/ do |row, column, what| 
   what = parse_from_yaml(what) if what.match(":")
  find_table(row, column, what)
end

Given /I select "(.*)" from "(.*)"/ do |option, what|
  option = parse_from_yaml(option) if option.match(":")
  find_select_list(option, what)
end

Given /I fill in the text field "(.*)" with "(.*)"/ do |what, with|    
  with = parse_from_yaml(with) if with.match(":")
  find_text_field(what, with)
end

Then /I should see the "(.*)" image/ do |image|
    assert(@browser.image(:src, /image/).height.to_i == 0) ? false : true 
   #assert((ff.image(:src, /nachbar3_medium.JPG/).height.to_i == 0 ), true)

end 

Then /I take a screenshot/ do 
  embed_screenshot("#{@screenshot_path}screenshot-#{Time.new.to_i}")
end

Then /I should see the span "(.*)" with "(.*)"/ do |what, with| 
  with = parse_from_yaml(with) if with.match(":")
  find_span(what, with)
end

Then /^I should (NOT )?see the text "(.*)"$/ do |visibility, what|
  what = parse_from_yaml(what) if what.match(":") 
  expected = (visibility.to_s.strip == 'NOT') ? assert_false(@browser.contains_text(what)) : assert(@browser.contains_text(what))
end

Then /^I should (NOT )?see the sentence "([^\"]*)"$/ do |visibility, what|  
  what = parse_from_yaml(what) if what.match(":")
  expected = (visibility.to_s.strip == 'NOT') ? assert_not_equal(@browser.contains_text(what), what) : assert_equal(@browser.contains_text(what), what)
end     

Then /^I debug$/ do
  debugger
end

Given /I am redirected to "(.*)"/ do |what|
  url = @browser.url
  assert_equal(@environment + what, url)
end

Given /^I am on (.+)$/ do |page_name| 
  @browser.goto(path_to(page_name))  #This step links up with the "path_to" method found in support/paths.rb
end

Given /^I go to "([^\"]*)"$/ do |url|
  @browser.goto(url)                 #Links to generic urls like "google.com"
end

Given /^I sleep for "([^\"]*)"$/ do |seconds|
  sleep seconds.to_i
end

