def check_missing_translations
  #create a hash and reads the url page content looking for given translation's missing template
  h = Hash.new
  if doc = Nokogiri.HTML(open(@browser.url))
    doc.text.each_line { |line|
      words = line.split
      words.each { |w|
        if w.match(TRANSLATION_TAG)
          if h.has_key?(w)
            h[w] = h[w] + 1
          else
            h[w] = 1
          end
        end
      }
    }

    # sort the hash by value, and then print it in this sorted order
    h.sort{|a,b| a[1]<=>b[1]}.each { |elem|
      puts "<li class=\"step failed\">Missing translation: <b>#{elem[0]}</b> has <b>#{elem[1]}</b> occurrences on #{@browser.url.to_s} page</li>"
      embed_screenshot("#{@screenshot_path}screenshot-#{Time.new.to_i}")
    }
  else
    return {}
  end
end
