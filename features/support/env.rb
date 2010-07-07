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
    
    #set browser : firefox / safari / chrome
    
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
 
 browser = Browser
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


 
  
