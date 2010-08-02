Given /I click the "(.*)" button/ do |what|
  what = parse_from_yaml(what) if fixture?(what)         
  find_button(what) 
end

Given /I click the "(.*)" checkbox/ do |what|
  what = parse_from_yaml(what) if fixture?(what)
  find_checkbox(what)
end
                             
Given /I click the "(.*)" div/ do |what|
  what = parse_from_yaml(what) if fixture?(what)
  find_div(what)
end

Given /I click the "(.*)" image/ do |what|
  what = parse_from_yaml(what) if fixture?(what)
  find_image(what)
end

Given /I click the "(.*)" link(.*)/ do |what, alert| 
  what = parse_from_yaml(what) if fixture?(what)             
  if alert == " with alert"
    click_alert_button_ok
  end   
  
    find_link(what)
end

Given /I onmouseover the "(.*)" link$/ do |what|   
  what = parse_from_yaml(what) if fixture?(what)
  @browser.link(:text, /#{what}/).exists?
  @browser.link(:text, /#{what}/).fire_event('onmouseover')
end

Given /I click the "(.*)" radio button/ do |what|
  what = parse_from_yaml(what) if fixture?(what)
  find_radio_button(what)
end

Given /I click row "(.*)" in the "(.*)" table/ do |row, column, what| 
   what = parse_from_yaml(what) if fixture?(what)
  find_table(row, column, what)
end

Given /I select "(.*)" from "(.*)"/ do |option, what|
  option = parse_from_yaml(option) if fixture?(option)
  find_select_list(option, what)
end

Given /I fill in the text field "(.*)" with "(.*)"/ do |what, with|    
  with = parse_from_yaml(with) if fixture?(with) 
  find_text_field(what, with)
end

Given /I fill in the date field "(.*)" with "(.*)"/ do |what, with|    
  with = parse_from_yaml(with) if fixture?(with)  
  find_text_field(what, calculate_date(with))
end


Given /I fill in the file field "(.*)" with "(.*)"/ do |what, with|    
  with = parse_from_yaml(with) if fixture?(with)
  find_file_field(what, with)
end


Then /I refresh the page/ do
  @browser.refresh 
  @browser.wait
end

Then /I should see the "(.*)" image/ do |image|
    assert(@browser.image(:src, /image/).height.to_i == 0) ? false : true 
   #assert((ff.image(:src, /nachbar3_medium.JPG/).height.to_i == 0 ), true)

end 

Then /I take a screenshot/ do 
  embed_screenshot("#{@screenshot_path}screenshot-#{Time.new.to_i}")
end

Then /I should see the span "(.*)" with "(.*)"/ do |what, with| 
  with = parse_from_yaml(with) if fixture?(with)
  find_span(what, with)
end

Then /^I should (NOT )?see the text "(.*)"$/ do |visibility, what|
  what = parse_from_yaml(what) if fixture?(what)           
  if @browser.class.to_s=="Watir::IE" 
   expected = (visibility.to_s.strip == 'NOT') ? assert_false(@browser.contains_text(what)) : assert(@browser.contains_text(what))     
 else
   expected = (visibility.to_s.strip == 'NOT') ? @browser.text.index(what).should == nil  : @browser.text.index(what).should >= 0
 end

end

Then /^I should (NOT )?see the sentence "([^\"]*)"$/ do |visibility, what|  
  what = parse_from_yaml(what) if fixture?(what)
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
Given /^I check all objects$/ do 
  create_output
end

