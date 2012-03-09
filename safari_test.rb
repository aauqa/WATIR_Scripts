require 'rubygems'
require 'safariwatir'

server_url = "http://discussion.academyart.edu/"
username = "nriley"

safari = Watir::Safari.new
safari.goto server_url

#Log In
safari.text_field(:name, 'username').set username
safari.text_field(:name, 'password').set '1bnsaud1'
safari.button(:name => 'buttonWrapper:login').click
