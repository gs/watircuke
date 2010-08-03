require 'rubygems'
require 'colorize'    
require 'fileutils'
require 'ruby-debug'    
require 'chronic'
require 'spec'
require 'test/unit/assertions'         
require 'features/support/create_screenshot_folder'
require 'features/support/screenshot'
require 'cucumber/formatter/unicode'


include Test::Unit::Assertions 

#set browser : ie / firefox / safari / chrome / celerity
    
bro = "firefox"
                  
case bro
  when "safari"
    require 'safariwatir'
    Browser = Watir::Safari.new
 
  when "firefox"

    require 'firewatir'
    Browser = FireWatir::Firefox.new  

   #require 'watir-webdriver'
   #Browser = Watir::Browser.new :firefox
     # require 'vapir'
     # require 'vapir-firefox'
     #  Browser = Vapir::Firefox.new
  
  when "chrome"
    require 'watir-webdriver'
    Browser = Watir::Browser.new :chrome 
     
 when "ie"
    require 'watir' 
    require 'watir/ie'
    require 'win32ole'    
    require 'win32/process'
    Browser = Watir::IE.new
    Browser.speed = :zippy #browser speed :fast / :zippy

 when "celerity"
   require 'celerity'
   Browser = Celerity::Browser.new
else
    raise "This platform is not supported (#{PLATFORM})"
end
                                      
                        
#create screenshot folder function
screenshot_path = create_screenshot_folder

#$table = {}

#define which fixture should be loaded         
                   
  
 browser = Browser
 # "before all"
 Before do    
   @table = {}
   
   @screenshot_path = screenshot_path
   
   @fixtures = %w/sanity_check_de/
   @fixtures.each { |table| @table.merge! YAML.load_file("features/fixtures/#{table}.yml") } 
   
   @browser = browser
   @environment = "http://"
 end
         
# after each step which is called '@new_feature' make a screenshot

AfterStep('@new_feature') do    
  embed_screenshot("#{@screenshot_path}screenshot-#{Time.new.to_i}") 
end
 
 # "after all"
 After do           
   # can close the browser after test
    # @browser.close 
 end


 
  
