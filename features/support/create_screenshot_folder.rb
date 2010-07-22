def create_screenshot_folder     
  begin
    t=Time.now.strftime("%y%m%d%H%M")
    screenshot_path = "features/screenshots/#{t}/"
    Dir.mkdir(screenshot_path) 
    return screenshot_path.to_s
  rescue Exception => ex
    puts
    puts "#{ex}".red
    puts
  end
 end
 