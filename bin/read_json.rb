# Ruby script to facilitate the YO email sending
# Takes a single argument; the email-in-question's json data
# Specification of the email instion's json data:
# email: {
#   n: 1,
#   subject: "subject field",
#   interlude: "html message (optional field)",
#   quote: "quotation",
#   author: "quote author",
#   cover: {
#     image_url: "imgur link to cover photo",
#     subtitle: "subtitle (optional field)",
#   }
#
#   trips: [
#     "Trip Title": {
  #     signup_link: "signup link",
  #     leaders: [
  #       "Liz Karron": "elizabeth.karron@yale.edu",
  #       "Marcus Russi": "marcus.russi@yale.edu"
  #      ],
#        date: "date",
#        cost: "some cost",signup link",
#        image_url: "imgur link",
#        blurb: "text"
#      }
#    ]
# }

require 'json'
require 'pry'
require 'erb'

string = $stdin.read
@data = JSON.parse(string)
template = File.open("templates/template.html.erb").read
email = ERB.new(template).result(binding)
print email
