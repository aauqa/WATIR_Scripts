#enter a Subject for a post
firefox.text_field(:name, "post.subject").set("Sample Post")
#enter text into tinymce
firefox.frame(:id => "post.body_ifr").send_keys 'hello world again'
#submit
firefox.button(:name, "createAndSaveNewPost").click
