#!/usr/bin/env ruby
require 'premailer'

mbody = $stdin.read
header = File.read('templates/boilerplate.html')
css = "<style>" + File.read('style.css') + "</style>"
prebody = "</head><body><table class='body'><tr><td class='center' align='center' valign='top'><center>"
postbody = "</center></td></tr></table></body></html>"

mail = header + css + prebody + mbody + postbody

File.open("mail", "w") do |out|
  out.puts mail
end

premailer = Premailer.new("mail", warn_level: Premailer::Warnings::SAFE)
File.open("html", "w") do |out|
  out.puts premailer.to_inline_css
end
File.open("plaintext", "w") do |out|
  out.puts premailer.to_plain_text
end



