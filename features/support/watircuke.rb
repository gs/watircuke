module WatirCukeHelpers
  def find_button(action, what)
    case
      when @browser.button(:id, what).exists?
           @browser.button(:id, what).fire_event(action)
       
      when @browser.button(:name, what).exists?
           @browser.button(:name, what).fire_event(action)
       
      when @browser.button(:value, what).exists?
           @browser.button(:value, what).fire_event(action)
       
      when @browser.button(:text, what).exists?
           @browser.button(:text, what).fire_event(action)
       
      when @browser.button(:index, what).exists?
           @browser.button(:index, what).fire_event(action)
         
      when @browser.button(:class, what).exists?
           @browser.button(:class, what).fire_event(action)
      else
        fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_checkbox(action, what)
    case
      when @browser.checkbox(:id, what).exists?
           @browser.checkbox(:id, what).fire_event(action)
       
      when @browser.checkbox(:name, what).exists?
           @browser.checkbox(:name, what).fire_event(action)
       
      when @browser.checkbox(:value, what).exists?
           @browser.checkbox(:value, what).fire_event(action)
       
      when @browser.checkbox(:text, what).exists?
           @browser.checkbox(:text, what).fire_event(action)
       
      when @browser.checkbox(:index, what).exists?
           @browser.checkbox(:index, what).fire_event(action)
      
      when @browser.checkbox(:class, what).exists?
          @browser.checkbox(:class, what).fire_event(action)
      else
        fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_image(action, what)
    case
      when @browser.image(:src, what).exists?
           @browser.image(:src, what).fire_event(action)
       
      when @browser.image(:id, what).exists?
           @browser.image(:id, what).fire_event(action)
      
      when @browser.image(:name, what).exists?
           @browser.image(:name, what).fire_event(action)
      
      when @browser.image(:text, what).exists?
           @browser.image(:text, what).fire_event(action)
      
      when @browser.image(:index, what).exists?
           @browser.image(:index, what).fire_event(action)
      
      when @browser.image(:class, what).exists?
           @browser.image(:class, what).fire_event(action)
      else
        fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end
     
  def find_link(action, what)
    case
      when @browser.link(:id, what).exists?
           @browser.link(:id, what).fire_event(action)
           
      when @browser.link(:text, what).exists?
           @browser.link(:text, what).fire_event(action)
       
      when @browser.link(:class, what).exists?
           @browser.link(:class, what).fire_event(action)
      
      when @browser.link(:title, what).exists?
           @browser.link(:title, what).fire_event(action)
      
      else
        fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_radio_button(action, what)
    case 
      when @browser.radio(:id, what).exists?
           @browser.radio(:id, what).fire_event(action)
       
      when @browser.radio(:name, what).exists?
           @browser.radio(:name, what).fire_event(action)
      
      when @browser.radio(:value, what).exists?
           @browser.radio(:value, what).fire_event(action)
      
      when @browser.radio(:text, what).exists?
           @browser.radio(:text, what).fire_event(action)
      
      when @browser.radio(:index, what).exists?
           @browser.radio(:index, what).fire_event(action)
      
      when @browser.radio(:class, what).exists?
           @browser.radio(:class, what).fire_event(action)
      else
        fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_table(row, column, what)
    row = row.to_i
    column = column.to_i
    case
      when @browser.table(:id, what).exists?
           @browser.table(:id, what)[row][column].click
           
      when @browser.table(:name, what).exists?
           @browser.table(:name, what)[row][column].click
       
      when @browser.table(:index, what).exists?
           @browser.table(:index, what)[row][column].click
       
      when @browser.table(:class, what).exists?
           @browser.table(:class, what)[row][column].click
      else  
        fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_select_list(option, what)
    case
      when @browser.select_list(:id, what).exists? 
           @browser.select_list(:id, what).select(option)

      when @browser.select_list(:name, what).exists?
           @browser.select_list(:name, what).select(option)

      when @browser.select_list(:value, what).exists?
           @browser.select_list(:value, what).select(option)

      when @browser.select_list(:text, what).exists?
           @browser.select_list(:text, what).select(option)

      when @browser.select_list(:index, what).exists?
           @browser.select_list(:index, what).select(option)

      when @browser.select_list(:class, /(^|\s)#{what}(\s|$)/).exists?
           @browser.select_list(:class, /(^|\s)#{what}(\s|$)/).set(option)
      else
        fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_text_field(what, with)
    case
      when @browser.text_field(:id, what).exists?
           @browser.text_field(:id, what).set(with)     
     
      when @browser.text_field(:name, what).exists?
           @browser.text_field(:name, what).set(with)
      
      when @browser.text_field(:value, what).exists?
           @browser.text_field(:value, what).set(with)
      
      when @browser.text_field(:index, what).exists?
           @browser.text_field(:index, what).set(with)  
      
      when @browser.text_field(:class, /(^|\s)#{what}(\s|$)/).exists?
          @browser.text_field(:class, /(^|\s)#{what}(\s|$)/).set(with)    
      else
        fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end                  
  
  def find_span(what,with)
       case
         
             when @browser.span(:id, what).exists?
                  @browser.span(:id, what) == with     

             when @browser.span(:name, what).exists?
                  @browser.span(:name, what) == with

             when @browser.span(:value, what).exists?
                  @browser.span(:value, what) == with

             when @browser.span(:index, what).exists?
                  @browser.span(:index, what) == with

             when @browser.span(:class, /(^|\s)#{what}(\s|$)/).exists?
                 @browser.span(:class, /(^|\s)#{what}(\s|$)/) == with
        else     
           fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element with " + "'#{with}'")
      end  
  end
  
  
  
end

World(WatirCukeHelpers)