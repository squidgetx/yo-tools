#!/usr/bin/env ruby
require 'net/smtp'
require 'mail'


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
  to ARGV[0]
  subject File.read('subject')
  text_part do
    body File.read('plaintext')
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body File.read('html')
  end
end

mail.deliver

