require 'test/unit/assertions'  
require 'features/support/create_screenshot_folder'
require 'features/support/screenshot'

include Test::Unit::Assertions 


if ENV['SAFARIWATIR']
  require 'safariwatir'
  Browser = Watir::Safari
else
  case RUBY_PLATFORM
  when /darwin/
  #  require 'safariwatir'
  #  Browser = Watir::Safari


    require 'firewatir'
    Browser = FireWatir::Firefox
                      
 #require 'watir-webdriver'
 #Browser = Watir::Browser.new :chrome
 
 
  when /win32|mingw/
    require 'watir'
    Browser = Watir::IE
  when /java/
    require 'celerity'
    Browser = Celerity::Browser
  else
    raise "This platform is not supported (#{PLATFORM})"
  end
end
                                      
                        
#create screenshot folder function
screenshot_path = create_screenshot_folder
 
 browser = Browser.new
 # "before all"
 Before do    
   @screenshot_path = screenshot_path    
   @browser = browser
   @environment = "http://"
 end
 
 # "after all"
 After do           
   # can close the browser after test
    # @browser.close 
 end


 
  
