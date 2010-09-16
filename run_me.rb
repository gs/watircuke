#!/usr/bin/env ruby
require 'rubygems'
require 'cucumber'
require 'colorize'


require 'features/support/create_screenshot_folder'
#this are the tests that have config_ files in config/machine/config..yml files - designed to work with sanity checks
tests=%w/sc_bbc_en sc_bbc_de sc_bbc_pl sc_bbc_es sc_staging_en sc_staging_de sc_staging_pl sc_staging_es sc_live_en sc_live_de sc_live_pl sc_live_es/

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
      system "cucumber --guess -t @#{test_name} -f html > #{folder}/../#{test_name}.html"
    elsif ((("#{ARGV[0]}" =~/\@/) || ("#{ARGV[0]}" =~ /features/)) && (!"#{ARGV[1]}".nil?))
      folder = setup(ARGV[1] ||= ARGV[0])
      system "cucumber --guess -t #{ARGV[0]} -f html > #{folder}/../#{ARGV[1]}.html"
    else
      puts "Did not found the test.".red
      puts 
      puts "You could run me with:"
      puts "./run_me.rb @tag output".green
      puts ""
      @tests.collect! {|x| x + ", " }
      print "or with any of the tests: "
      print "#{@tests}".yellow
      puts
      puts "./run_me.rb sc_live_en".green
    end
  end

  def setup(folder)
    t=Time.now.strftime("%y%m%d%H%M")
    folder = create_screenshot_folder("#{folder}", t)
  end

  def name_the_test
    ARGV[0].gsub(/\_\w+\_/,"_")
  end

  def copy_config_yml_file
    config_name = ARGV[0].gsub("sc", "config")
    FileUtils.cp "./config/machines/#{config_name}.yml", "./config/config.yml"
  end

end

run = RunMe.new(tests)

run.start
