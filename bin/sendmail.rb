#!/usr/bin/env ruby
require 'net/smtp'
require 'mail'

puts "The email to the YO general panlist is going out in 5 minutes! You can cancel with CTRL-C if you have any doubts!"
sleep 300


options = { address: 'smtp.gmail.com',
            port: 587,
            domain: 'yale.edu',
            user_name: 'sylvan.zheng@yale.edu',
            password: File.read('secrets/password'),
            authentication: 'login',
            enable_starttl_auto: true}

Mail.defaults do
  delivery_method :smtp, options
end

mail = Mail.new do
  from 'sylvan.zheng@yale.edu'
  to 'the_panlist@whatever.com'
  subject 'test'
  text_part do
    body File.read('plaintext')
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body File.read('html')
  end
end

mail.deliver

