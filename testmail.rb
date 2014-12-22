#!/usr/bin/env ruby
require 'net/smtp'
require 'mail'


options = { address: 'smtp.gmail.com',
            port: 587,
            domain: 'yale.edu',
            user_name: 'sylvan.zheng@yale.edu',
            password: File.read('password'),
            authentication: 'login',
            enable_starttl_auto: true}

Mail.defaults do
  delivery_method :smtp, options
end

mail = Mail.new do
  from 'sylvan.zheng@yale.edu'
  to 'sylvan.zheng@yale.edu'
  subject 'test'
  text_part do
    body "lol owned"
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body $stdin.read
  end
end

mail.deliver

