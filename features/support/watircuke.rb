module WatirCukeHelpers
	def find_button(action, what)					
		case
					when @browser.button(:id, what).exists?
							 then @browser.button(:id, what).fire_event(action)
						 
						when @browser.button(:name, what).exists?
								 then @browser.button(:name, what).fire_event(action)
			
						when @browser.button(:value, what).exists?
								 then @browser.button(:value, what).fire_event(action) 
						
						when @browser.button(:text, what).exists?
								 then @browser.button(:text, what).fire_event(action)
						 
						when @browser.button(:index, what).exists?
								 then @browser.button(:index, what).fire_event(action)
							 
						when @browser.button(:class, what).exists?
								 then @browser.button(:class, what).fire_event(action)
								 
								
			#			 when @browser.button(:text, /#{what}/).exists?
			#						then @browser.button(:text, /#{what}/).fire_event(action)								
			else 
				fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
		end
	end

	def find_checkbox(action, what)
		case
			when @browser.checkbox(:id, what).exists?
					 then @browser.checkbox(:id, what).fire_event(action)
			 
			when @browser.checkbox(:name, what).exists?
					 then @browser.checkbox(:name, what).fire_event(action)
			 
			when @browser.checkbox(:value, what).exists?
					 then @browser.checkbox(:value, what).fire_event(action)
			 
			when @browser.checkbox(:text, what).exists?
					 then @browser.checkbox(:text, what).fire_event(action)
			 
			when @browser.checkbox(:index, what).exists?
					 then @browser.checkbox(:index, what).fire_event(action)
			
			when @browser.checkbox(:class, what).exists?
					 then @browser.checkbox(:class, what).fire_event(action)
			else
				fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
		end
	end

	def find_image(action, what)
		case
			when @browser.image(:src, what).exists?
					 then @browser.image(:src, what).fire_event(action)
			 
			when @browser.image(:id, what).exists?
					 then @browser.image(:id, what).fire_event(action)
			
			when @browser.image(:name, what).exists?
					 then @browser.image(:name, what).fire_event(action)
			
			when @browser.image(:text, what).exists?
					 then @browser.image(:text, what).fire_event(action)
			
			when @browser.image(:index, what).exists?
					 then @browser.image(:index, what).fire_event(action)
			
			when @browser.image(:alt, what).exists?
					 then @browser.image(:alt, what).fire_event(action)
			
			when @browser.image(:class, what).exists?
					 then @browser.image(:class, what).fire_event(action)
			else
				fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
		end
	end
		 
	def find_link(action, what)
		case
			when @browser.link(:id, what).exists?
					 then @browser.link(:id, what).fire_event(action)
					 
			when @browser.link(:text, what).exists?
					 then @browser.link(:text, what).fire_event(action)
			 
			when @browser.link(:class, what).exists?
					 then @browser.link(:class, what).fire_event(action)
			
			when @browser.link(:title, what).exists?
					 then @browser.link(:title, what).fire_event(action)
			
			when @browser.link(:text, /#{what}/).exists?
					 then @browser.link(:text, /#{what}/).fire_event(action)
			
			when @browser.link(:id, /#{what}/).exists?
					 then @browser.link(:id, /#{what}/).fire_event(action)
			
			when @browser.link(:href, /#{what}/).exists?
					then	@browser.link(:href, /#{what}/).fire_event(action)
			else
				fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
		end
	end

	def find_radio_button(action, what)
		case 
			when @browser.radio(:id, what).exists?
					 then @browser.radio(:id, what).fire_event(action)
			 
			when @browser.radio(:name, what).exists?
					 then @browser.radio(:name, what).fire_event(action)
			
			when @browser.radio(:value, what).exists?
					 then @browser.radio(:value, what).fire_event(action)
			
			when @browser.radio(:text, what).exists?
					 then @browser.radio(:text, what).fire_event(action)
			
			when @browser.radio(:index, what).exists?
					 then @browser.radio(:index, what).fire_event(action)
			
			when @browser.radio(:class, what).exists?
					 then @browser.radio(:class, what).fire_event(action)
			else
				fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
		end
	end

	def find_table(row, column, what)
		row = row.to_i
		column = column.to_i
		case
			when @browser.table(:id, what).exists?
					 then @browser.table(:id, what)[row][column].click
					 
			when @browser.table(:name, what).exists?
					 then @browser.table(:name, what)[row][column].click
			 
			when @browser.table(:index, what).exists?
					 then @browser.table(:index, what)[row][column].click
			 
			when @browser.table(:class, what).exists?
					 then @browser.table(:class, what)[row][column].click
			else	
				fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
		end
	end

	def find_select_list(option, what)
		case
			when @browser.select_list(:id, what).exists? 
					 then @browser.select_list(:id, what).select(option)

			when @browser.select_list(:name, what).exists?
					 then @browser.select_list(:name, what).select(option)

			when @browser.select_list(:value, what).exists?
					 then @browser.select_list(:value, what).select(option)

			when @browser.select_list(:text, what).exists?
					 then @browser.select_list(:text, what).select(option)

			when @browser.select_list(:index, what).exists?
					 then @browser.select_list(:index, what).select(option)

			when @browser.select_list(:class, /(^|\s)#{what}(\s|$)/).exists?
					 then @browser.select_list(:class, /(^|\s)#{what}(\s|$)/).set(option)
			else
				fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
		end
	end

	def find_text_field(what, with)
		case
			when @browser.text_field(:id, what).exists?
					 then @browser.text_field(:id, what).set(with)		 
		 
			when @browser.text_field(:name, what).exists?
					 then @browser.text_field(:name, what).set(with)
			
			when @browser.text_field(:value, what).exists?
					 then @browser.text_field(:value, what).set(with)
			
			when @browser.text_field(:index, what).exists?
					 then @browser.text_field(:index, what).set(with)	 
			
			when @browser.text_field(:class, /(^|\s)#{what}(\s|$)/).exists?
					 then @browser.text_field(:class, /(^|\s)#{what}(\s|$)/).set(with)		
			else
				fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
		end
	end				 
	
	def find_file_field(what, with)
		case
			when @browser.file_field(:id, what).exists?
					 then @browser.file_field(:id, what).set(with)		 
		 
			when @browser.field_field(:name, what).exists?
					 then @browser.field_field(:name, what).set(with)
			
			when @browser.field_field(:value, what).exists?
					 then @browser.field_field(:value, what).set(with)
			
			when @browser.field_field(:index, what).exists?
					 then @browser.field_field(:index, what).set(with)	
			
			when @browser.field_field(:class, /(^|\s)#{what}(\s|$)/).exists?
					 then @browser.field_field(:class, /(^|\s)#{what}(\s|$)/).set(with)		 
			else
				fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
		end
	end							
	
	def find_span(what,with)
			 case
						 when @browser.span(:id, what).exists?
									then @browser.span(:id, what) == with			

						 when @browser.span(:name, what).exists?
									then @browser.span(:name, what) == with

						 when @browser.span(:value, what).exists?
									then @browser.span(:value, what) == with

						 when @browser.span(:index, what).exists?
									then @browser.span(:index, what) == with

						 when @browser.span(:class, /(^|\s)#{what}(\s|$)/).exists?
									then @browser.span(:class, /(^|\s)#{what}(\s|$)/) == with
				else		 
					 fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element with " + "'#{with}'")
			end	 
	end
			 
	def find_div(action, what)
		 case
			 when @browser.div(:id, what).exists?
						then @browser.div(:id, what).fire_event(action)

			 when @browser.div(:name, what).exists?
						then @browser.div(:name, what).fire_event(action)

			 when @browser.div(:value, what).exists?
						then @browser.div(:value, what).fire_event(action)

			 when @browser.div(:text, what).exists?
						then @browser.div(:text, what).fire_event(action)

			 when @browser.div(:index, what).exists?
						then @browser.div(:index, what).fire_event(action)

			 when @browser.div(:class, what).exists?
						then @browser.div(:class, what).fire_event(action)
			 else
				 fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
		 end
	 end	
	
	def click_alert_button_ok
     begin
       @browser.startClicker('OK', 3)
     rescue Exception => ex
       fail("Sorry could not found the javascript alert")
     end
	end											
	
	def create_output
	  begin
		  File.open("all_objects.txt", "w") { |f| f.puts(@browser.show_all_objects) }
	  rescue Exception => ex
	    fail("Sorry could not load an object ?", ex)
    end
	end											
	
	def parse_from_yaml(with)	 
		w = with.gsub(":","").split(".")
		return @table[w[0]][w[1]]
	end

 #validate if this is a fixture
	def fixture?(value)
	    value =~ /^\:\w*\./
	end                  
	
	def calculate_date(datevalue)    
	  begin
     return @formatdate = Chronic.parse(datevalue).strftime("%d-%m-%Y")
   rescue Exception => ex
     puts "#{ex}".red
   end
	 
	end
	
end

World(WatirCukeHelpers)