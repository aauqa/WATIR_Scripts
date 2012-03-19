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

#goto Pre or Post
firefox.goto(server)
#Enter User/Pass, then click Login
firefox.text_field(:name, "username").set(username)
firefox.text_field(:name, "password").set(password)
firefox.button(:name, "buttonWrapper:login").click
#wait, webdriver is too fast
sleep 2

#Gets us to HomePage

#From here, we map out a click pattern that user will take.
firefox.links[19].click
# same as firefox.link(:text, "FSH_102_OL3: Fashion Illustration 1')
sleep 1
  #If grading form is active, click through
  if firefox.text.include? "Official Grading Form"
    firefox.link(:text, "here").click
    sleep 2;
  end
#go to Discussion
firefox.links[10].click
sleep 1
#go to Instructor's Office
firefox.links[45].click
#from here we make a post, or reply to one in existence with quotes
firefox.links[33].click #reply w/ quotes to first post
sleep 1
#enter a Subject for a post
firefox.text_field(:name, "post.subject").set("Sample Post")
#enter text into tinymce
firefox.frame(:id => "post.body_ifr").send_keys 'hello world again'
#submit
firefox.button(:name, "createAndSaveReplyToPost").click
#wait, webdriver is too fast
sleep 1

puts firefox.divs(:class, "topic-post").last.divs[1].html
