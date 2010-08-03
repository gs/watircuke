def create_screenshot_folder     
  begin
    t=Time.now.strftime("%y%m%d%H%M")
    screenshot_path = "test_results/test_#{t}/screenshots/"
    FileUtils.mkpath(screenshot_path)
    screenshot_path = Dir.pwd.gsub("/", "\\") + "\\" + screenshot_path.gsub("/", "\\") if Cucumber::WINDOWS
	return screenshot_path.to_s
  rescue Exception => ex
    puts
    puts "#{ex}".red
    puts
  end
 end
 