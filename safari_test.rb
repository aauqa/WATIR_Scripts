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

browser = Watir::Safari.new
browser.goto(server)
browser.text_field(:name, "username").set(username)
browser.password(:name, "password").set(password)
browser.button(:name, "buttonWrapper:login").click

puts "FAILURE" unless browser.contains_text("Current")