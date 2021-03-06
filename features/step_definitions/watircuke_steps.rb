Transform /^\:\w*\.\w*$/ do |step_arg|
  what = parse_from_yaml(step_arg)   if fixture?(step_arg)
end

# Given /I click the "(.*)" button/ do |what|
#   find_button(what)
# end

Given /I click the "(.*)" button(.*)/ do |what, alert|
  if alert == " with alert"
    click_alert_button_ok
  end   
  find_button(what)
end


Given /I click the "(.*)" checkbox/ do |what|
  find_checkbox(what)
end

Given /I click the "(.*)" div/ do |what|
  find_div(what)
end

Given /I click the "(.*)" image/ do |what|
  find_image(what)
end

Given /I click the "(.*)" link(.*)/ do |what, what2|
  if what2 == " with alert"
    click_alert_button_ok
    find_link(what)
  elsif what2 =~ /with index \d+/                    
    index = what2.gsub(" with index ","")
    @browser.link(:text => what, :index => index.to_i).click
  else    
  find_link(what)
end
end                           

Given /I onmouseover the "(.*)" link$/ do |what|   
  @browser.link(:text, /#{what}/).exists?
  @browser.link(:text, /#{what}/).fire_event('onmouseover')
end

Given /I click the "(.*)" radio button/ do |what|
  find_radio_button(what)
end

Given /I click row "(.*)" in the "(.*)" table/ do |row, column, what|
  find_table(row, column, what)
end

Given /I select "(.*)" from "(.*)"/ do |with, what|
  find_select_list(with, what)
end

Given /I fill in the text field "(.*)" with "(.*)"/ do |tf_name, what| 
    find_text_field(tf_name, what)
end

Given /I fill in the date field "(.*)" with "(.*)"/ do |tf_name, what| 
    find_text_field(tf_name, calculate_date(what))
end



Given /I fill in the file field "(.*)" with "(.*)"/ do |ff_name, what|    
  find_file_field(ff_name, what)
end


Then /I refresh the page/ do
  @browser.refresh
  #  @browser.wait
end

Then /I should see the "(.*)" image/ do |what|
  assert(@browser.image(:src, /what/).height.to_i == 0) ? false : true
end

Then /I take a screenshot/ do
   t = Time.new.to_i
   embed_screenshot("#{@screenshot_path}screenshot-#{t}", "screenshots/screenshot-#{t}")
end

Then /I should see the span "(.*)" with "(.*)"/ do |span, what|
  find_span(span, what)
end

Then /^I should (NOT )?see the text "(.*)"$/ do |visibility, what|      
  expected = (visibility.to_s.strip == 'NOT') ? @browser.text.index(what).should == nil  : @browser.text.index(what).should >= 0
end

Then /^It should (NOT )?contains the html "([^\"]*)"$/ do |visibility, what|
  expected = (visibility.to_s.strip == 'NOT') ? @browser.html.index(what).should == nil  : @browser.html.index(what).should >= 0
end

Then /I click the "(.*)" link until I see the text "(.*)"/ do |click_link, what_to_see| 
  find_link(click_link)
    while !@browser.text.index(what_to_see) do
          @browser.back
          sleep 10        
          find_link(click_link)
   end                   
  @browser.text.index(what_to_see) != nil
end

Then /^I debug$/ do
  debugger
end

Given /I am redirected to "(.*)"/ do |what|
  url = @browser.url
  assert_equal(@environment + what, url)
end

Given /^I am on the "(.+)" page$/ do |page_name| 
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

Then /sleep until I see the text "(.*)"/ do |what| 
# expected = @browser.text.index(what).should >= 0
    while !@browser.text.index(what) do
          sleep 1
    end                   
  @browser.text.index(what) != nil
end
