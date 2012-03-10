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

#open FireFox Browser
firefox = Watir::Browser.new :firefox
#goto Pre or Post
firefox.goto(server)

#Enter User/Pass, then click Login
firefox.text_field(:name, "username").set(username)
firefox.text_field(:name, "password").set(password)
firefox.button(:name, "buttonWrapper:login").click
#wait, webdriver is too fast
sleep 1
#click on course name
#example - puts firefox.link(:text, "FSH_102_OL3: Fashion Illustration 1").to_s()
firefox.link(:text, "FSH_102_OL3: Fashion Illustration 1").click
#wait, webdriver is too fast
sleep 1
  #If grading form is active, click through
  if firefox.text.include? "Official Grading Form"
    firefox.link(:text, "here").click
    sleep 2;
  end
#wait, webdriver is too fast
sleep 1
#Click Discussion
firefox.link(:text, "Discussion").click
#wait, webdriver is too fast
sleep 1
#Click Instructors office
firefox.link(:text, "Instructor's Office").click
#wait, webdriver is too fast
sleep 1
#enter a Subject for a post
firefox.text_field(:name, "post.subject").set("Sample Post")
#enter text into tinymce
firefox.frame(:id => "post.body_ifr").send_keys 'hello world again'
#submit
firefox.button(:name, "createAndSaveNewPost").click
#wait, webdriver is too fast
sleep 1
if firefox.link(:name, "scrollToPost").exists?
  puts "PASSED: New post was created in Instructor's Office, scolltoPost anchor was present upon completion"
else
  puts"FAILED: New post was not created, no scollToPost anchor present"
end
