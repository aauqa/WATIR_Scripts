require 'rubygems'
require 'watir-webdriver'

######################################################
#
#
#  Create new post in course
#  SH_102_OL3: Fashion Illustration 1
#  for user VHEIN2
#
#
######################################################
#open FireFox Browser
firefox = Watir::Browser.new :firefox
#prints out command line args
#should be called with ruby ff_osx.rb USERNAME PASS post/pre
puts "Called with: " + ARGV[0] + " , " + ARGV[1] + " , " + ARGV[2]
#set Username/Pass
username = ARGV[0]
password = ARGV[1]
#set server - post|pre
if ARGV[2] == "post"
  puts "calling on QA-Post"
  server = "http://qa-post-production.dev.academyart.edu"
elsif ARGV[2] == "pre"
  puts "calling on QA-Pre"
  server = "http://qa-pre-production.dev.academyart.edu"
else
  puts "Use a third ARg!"
end

def chooseLinks (browser)
  
  counter = 0
  browser.links.each{ |l|
    if l.text.empty? == false
      puts counter.to_s + "- " + l.text
      #puts l.html   
    end
    counter = counter + 1      
  }
  counter = 0
  puts "Choose a link"  
  result = $stdin.gets.chomp
  browser.links[result.to_i].click
  
end
#goto Pre or Post
firefox.goto(server)

#Enter User/Pass, then click Login
firefox.text_field(:name, "username").set(username)
firefox.text_field(:name, "password").set(password)
firefox.button(:name, "buttonWrapper:login").click
#wait, webdriver is too fast
sleep 2
chooseLinks(firefox)
  #If grading form is active, click through
  if firefox.text.include? "Official Grading Form"
    firefox.link(:text, "here").click
    sleep 2;
  end
chooseLinks(firefox)
chooseLinks(firefox)