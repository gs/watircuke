require 'rubygems'
require 'ruby-debug'    
require 'test/unit/assertions'  
require 'features/support/create_screenshot_folder'
require 'features/support/screenshot'
require 'cucumber/formatter/unicode'


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

@fixtures = %w/ login_de /
 @fixtures.each do |table|
   $table = YAML.load_file("features/fixtures/#{table}.yml")
   #table.classify.constantize#.delete_all
 end
  
 browser = Browser
 # "before all"
 Before do  
   #define which fixture should be loaded         
   
   @screenshot_path = screenshot_path
   @browser = browser
   @environment = "http://"
 end
 
 # "after all"
 After do           
   # can close the browser after test
    # @browser.close 
 end


 
  
