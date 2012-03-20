class AAU
  require 'watir-webdriver'
  $firefox
  def initialize
    $firefox = Watir::Browser.new :firefox 
  end
  #list all links, wait to choose which to click
  
  def links
    counter = 0
    $firefox.links.each{ |l|
    if l.text.empty? == false
      puts counter.to_s + "- " + l.text 
    end
    counter = counter + 1      
    }
    counter = 0
    puts "Choose a link:"  
    result = $stdin.gets.chomp
    if result.empty? == false
      $firefox.links[result.to_i].click  
    else puts "No selection made"
    end
  end
  
  
  def textboxes(sampletext)
    counter = 0
    $firefox.text_fields.each{ |l|
      puts counter.to_s + "- " + l.name 
    counter = counter + 1      
    }
    counter = 0
    puts "Which box to enter text"
    result = $stdin.gets.chomp
    if result.empty? == false
      $firefox.text_fields[result.to_i].set(sampletext)  
    else puts "No selection made"
    end    
  end
  
  
  def dropdowns(option)
    counter = 0
    $firefox.select_lists.each{ |l|
      puts counter.to_s + "- " + l.name 
    counter = counter + 1      
    }
    counter = 0
    puts "Which box to enter text"
    result = $stdin.gets.chomp
    if result.empty? == false
      $firefox.select_lists[result.to_i].select(option)  
    else puts "No selection made"
    end    
  end 
  
  def login(username, password, serverShort)
    if serverShort == "post"
      puts "calling on QA-Post"
      server = "http://qa-post-production.dev.academyart.edu"
    elsif serverShort == "pre"
      puts "calling on QA-Pre"
      server = "http://qa-pre-production.dev.academyart.edu"
    else
      puts "Use a third ARg!"
    end
    $firefox.goto(server)
    sleep 1
    $firefox.text_field(:name, "username").set(username)
    $firefox.text_field(:name, "password").set(password)
    $firefox.button(:name, "buttonWrapper:login").click
  end
  
  def userAgent
    tempurl = $firefox.url
    $firefox.goto('http://aauqa.github.com/serverStatus')
    sleep 1
    puts $firefox.p(:class,"useragent").text
    $firefox.goto(tempurl)
  end
end
