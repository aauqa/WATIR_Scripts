   require 'rubygems'
    require 'watir-webdriver'
    
    username = 
    password = 
    server = 
    courseName = 
    discussionTopic = 

#load watir module and make new instance of Firefox browser
require('watir-webdriver')
firefox = Watir::Browser.new :firefox
#Enter User/Pass, then click Login
firefox.goto(server)
firefox.text_field(:name, "username").when_present.set(username)
firefox.text_field(:name, "password").when_present.set(password)
firefox.button(:name, "buttonWrapper:login").click
firefox.button(:name, "buttonWrapper:login").wait_while_present
#User Home - Click on Course
firefox.link(:text, courseName).when_present.click
#If grading form is active, click through
if firefox.text.include? "Official Grading Form"
    firefox.link(:text, "here").click
    firefox.link(:text, "here").wait_while_present
end
#Go to Discussion
firefox.link(:text, "Discussion").when_present.click
#Go to discussionTopic
firefox.link(:text, discussionTopic).when_present.click
#Input Subject and Post Text
firefox.text_field(:name, "post.subject").when_present.set("Sample Post")
#enter text into tinymce
firefox.frame(:id => "post.body_ifr").send_keys 'hello world again'
#Hold for tech to upload 8 files (sequentially), when complete, click submit button
puts "Upload attachments by hand, press enter to continue"
wait = $stdin.gets.chomp
firefox.button(:name, "createAndSaveNewPost").click
#Print userAgent to screen
tempurl = firefox.url
firefox.goto('http://aauqa.github.com/serverStatus')
puts firefox.p(:class,"useragent").text
firefox.goto(tempurl)