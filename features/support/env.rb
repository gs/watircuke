require 'rubygems'
require 'ruby-debug'    
require 'test/unit/assertions'         
require 'action_controller'
require 'action_controller/assertions/selector_assertions'
require 'features/support/create_screenshot_folder'
require 'features/support/screenshot'
require 'cucumber/formatter/unicode'


include Test::Unit::Assertions 
include ActionController::Assertions::SelectorAssertions

if ENV['SAFARIWATIR']
  require 'safariwatir'
  Browser = Watir::Safari
else
  case RUBY_PLATFORM
  when /darwin/
    
    #set browser : firefox / safari / chrome / celerity
    
    bro = 'firefox'                                        
                  
    case bro
    when /safari/
      require 'safariwatir'
      Browser = Watir::Safari.new
    when /firefox/     
      require 'firewatir'
      Browser = FireWatir::Firefox.new
    when /chrome/
      require 'watir-webdriver'
      Browser = Watir::Browser.new :chrome
   end
 
  when /win32|mingw/
    require 'watir'
    Browser = Watir::IE.new
  when /java/
    require 'celerity'
    Browser = Celerity::Browser.new
  else
    raise "This platform is not supported (#{PLATFORM})"
  end
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
   
   @fixtures = %w/create_event_de login_de/
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


 
  
