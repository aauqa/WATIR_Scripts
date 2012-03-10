require "rubygems"
require 'safariwatir'
puts "Called with: " + ARGV[0] + " , " + ARGV[1] 
username = ARGV[0]
password = ARGV[1]
server = ARGV[2]
#Make a new Safari Browser
safari = Watir::Safari.new
#Define a test
#Go To Discussion as Instructor
def safari.goToDiscussion
  goto(ARGV[2]);  
  #Enter User/Pass, then click Login
  text_field(:name, "username").set(ARGV[0])
  password(:name, "password").set(ARGV[1])
  button(:name, "buttonWrapper:login").click
  sleep 1
  ######################################################
  # GO TO Courses Dashboard
  puts link(:text, "FSH_102_OL3: Fashion Illustration 1").to_s()
  link(:text, "FSH_102_OL3: Fashion Illustration 1").click()
  #Checks to see if HTML of page contains word "Current", writes FAILURE
  #to screen if no such text is present
  if contains_text("Official Grading Form")
    link(:text, "here").click()
    sleep 1.5;
  end
  link(:text, "DISCUSSION").click()
  sleep 1
  link(:text, "<b>Instructor's Office</b>").click()
  #puts "FAILURE" unless contains_text("Official Grading Form - Midterm")
  
end

begin
  safari.goToDiscussion
end
