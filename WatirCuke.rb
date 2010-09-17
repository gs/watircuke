#!/usr/bin/env ruby
require 'rubygems'
require 'cucumber'
require 'colorize'

require 'features/support/create_screenshot_folder'

#this are the tests that have config_ files in config/machine/config_*.yml files - designed to work with sanity checks
tests=%w/bbc_en bbc_de bbc_pl bbc_es staging_en staging_de staging_pl staging_es live_en live_de live_pl live_es/

class RunMe                       
  
  def initialize(tests)
    @tests = tests
    system "killall -9 firefox-bin"
  end

  def start
    if @tests.include?(ARGV[0])
      test_name = name_the_test
      copy_config_yml_file
      folder = setup(ARGV[0])
      system "cucumber --guess -t @#{test_name} -f html > #{folder}/../#{ARGV[0]}.html"
    elsif ((("#{ARGV[0]}" =~/\@/) || ("#{ARGV[0]}" =~ /features/)) && (!"#{ARGV[1]}".nil?))
      folder = setup(ARGV[1] ||= ARGV[0].gsub("\@",""))
      system "cucumber --guess -t #{ARGV[0]} -f html > #{folder}/../#{ARGV[1]}.html"
    else
      puts "Did not found the test.".red
      puts 
      puts "You could run me with:"
      puts "./WatirCuke.rb @tag output".green
      puts "or"
      puts "./WatirCuke.rb features/my_test.feature output".green
      puts " "
      @tests.collect! {|x| x + ", " }
      print "or with any of the tests: "
      print "#{@tests}".yellow
      puts
      puts "./WatirCuke.rb live_en".green
    end
  end

  def setup(folder)
    t=Time.now.strftime("%y%m%d%H%M")
    create_screenshot_folder("#{folder}", t)
  end

  def name_the_test
    ARGV[0].gsub(/\w+\_/,"")
  end

  def copy_config_yml_file
    config_name = "config_" + ARGV[0].to_s
    FileUtils.cp "./config/machines/#{config_name}.yml", "./config/config.yml"
  end

end

run = RunMe.new(tests)

run.start
