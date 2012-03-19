########################################################################
#Log into LMS with username, pass, and server
#should be called with ruby ff_osx.rb USERNAME PASS post/pre
########################################################################
require 'rubygems'
require 'watir-webdriver'
#prints out command line args
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

#open FireFox Browser
firefox = Watir::Browser.new :firefox
#goto Pre or Post
firefox.goto(server)

#Enter User/Pass, then click Login
firefox.text_field(:name, "username").set(username)
firefox.text_field(:name, "password").set(password)
firefox.button(:name, "buttonWrapper:login").click
########################################################################