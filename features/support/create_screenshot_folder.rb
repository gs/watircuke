require 'fileutils'

def create_screenshot_folder(folder, t)     
  begin
    FileUtils.mkpath("test_results/#{folder}_#{t}/screenshots")
  rescue Exception => ex
    puts "#{ex}".red
  end
 end
 