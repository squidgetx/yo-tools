#!/usr/bin/env ruby

# Ruby script to facilitate the YO email sending
# Takes a single argument; the email-in-question's json data
# Specification of the email instion's json data:

require 'json'
require 'pry'
require 'erb'

string = $stdin.read
@data = JSON.parse(string)
template = File.open("templates/template.html.erb").read
email = ERB.new(template).result(binding)
print email
