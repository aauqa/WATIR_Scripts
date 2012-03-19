  #If grading form is active, click through
  if firefox.text.include? "Official Grading Form"
    firefox.link(:text, "here").click
    sleep 2;
  end