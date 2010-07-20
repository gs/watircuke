def create_screenshot_folder     
    t=Time.now.strftime("%y%m%d%H%M")
    screenshot_path = "features/screenshots/#{t}/"
    Dir.mkdir(screenshot_path) 
    return screenshot_path.to_s
 end