require 'rubygems'
require 'colorize'
require 'fileutils'
require 'ruby-debug'
require 'chronic'
require 'spec'
require 'nokogiri'
require 'open-uri'
require 'test/unit/assertions'
require 'features/support/read_config'
require 'features/support/create_screenshot_folder'
require 'features/support/screenshot'
require 'features/support/check_missing_translations'
require 'cucumber/formatter/unicode'
include Test::Unit::Assertions


begin
  #read the config.yml file found in config/config.yml
  ##--------------------------------------------------
  read_config

  BROWSER = @browser
  CHECK_TRANSLATIONS = @check_translation
  TRANSLATION_TAG = @translation_tag
  LANGUAGES = @fixtures

  ##-------------------------------------------------
  case BROWSER
  when "safari"
    require 'safariwatir'
    Browser = Watir::Safari.new

  when "firefox"

#     require 'firewatir'

#    require 'watir/firewatir/lib/firewatir'
#    Browser = FireWatir::Firefox.new

    require 'watir-webdriver'
    Browser = Watir::Browser.new :firefox

    # require 'vapir-firefox'
    # Browser = Vapir::Firefox.new
    # 
    # class Vapir::Firefox::Element
    #   def type_keys
    #     false
    #   end
    # end

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

  browser = Browser
  # "before all"
  Before do
    @table = {}
    @screenshot_path = screenshot_path

    LANGUAGES.each { |table| @table.merge! YAML.load_file("features/fixtures/#{table}.yml") }
    @table.merge! YAML.load_file("config/config.yml")

    @browser = browser
    @environment = "http://"
    @time = Time.now
  end

  #after each scenario: checking for missing translation on page, count scenario time, makes screenshot if failed
  After do |scenario|        
    check_missing_translations if CHECK_TRANSLATIONS
    scenario_time(@time)
    embed_screenshot("#{@screenshot_path}screenshot-#{Time.new.to_i}") if scenario.failed?
  end

  # after each step which is called '@new_feature' make a screenshot
  AfterStep('@new_feature') do
    embed_screenshot("#{@screenshot_path}screenshot-#{Time.new.to_i}")
  end
rescue Exception => ex
  puts "#{ex}".red
end
