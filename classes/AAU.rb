class AAU
  def initialize
    
  end
  def links(browser)
  counter = 0
  browser.links.each{ |l|
    if l.text.empty? == false
      puts counter.to_s + "- " + l.text 
    end
    counter = counter + 1      
  }
  counter = 0
  puts "Choose a link:"  
  result = $stdin.gets.chomp
  browser.links[result.to_i].click  
  end
  def login(browser, username, password, serverShort)
    if serverShort == "post"
      puts "calling on QA-Post"
      server = "http://qa-post-production.dev.academyart.edu"
    elsif serverShort == "pre"
      puts "calling on QA-Pre"
      server = "http://qa-pre-production.dev.academyart.edu"
    else
      puts "Use a third ARg!"
    end
    browser.goto(server)
    sleep 1
    browser.text_field(:name, "username").set(username)
    browser.text_field(:name, "password").set(password)
    browser.button(:name, "buttonWrapper:login").click
  end
end
