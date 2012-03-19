require 'rubygems'
require 'safariwatir'

puts "Called with: " + ARGV[0] + " , " + ARGV[1] 
username = ARGV[0]
password = ARGV[1] 
if ARGV[2] == "post"
  puts "calling on QA-Post"
  server = "http://qa-post-production.dev.academyart.edu"
elsif ARGV[2] == "pre"
  puts "calling on QA-Pre"
  server = "http://qa-pre-production.dev.academyart.edu"
else
  puts "Use a third ARg!"
end

######################################################
#
#
#
#
#
#
#
######################################################
#Make a new Safari Browser
browser = Watir::Safari.new
#Navigate to ServerURL
browser.goto(server)
#Enter User/Pass, then click Login
browser.text_field(:name, "username").set(username)
browser.password(:name, "password").set(password)
browser.button(:name, "buttonWrapper:login").click
######################################################
# GO TO Courses Dashboard
browser.link(:text, "Dashboard").click
browser.link(:href, "courseList").click
#Checks to see if HTML of page contains word "Current", writes FAILURE
#to screen if no such text is present
puts "FAILURE" unless browser.contains_text("Current")
