#!/usr/bin/env ruby

# Ruby script to facilitate the YO email sending
# Takes a single argument; the email-in-question's json data
# Specification of the email instion's json data:

require 'json'
require 'pry'
require 'erb'
require 'fastimage'


string = $stdin.read
@data = JSON.parse(string)
template = File.open("templates/template.html.erb").read




@data['trips'].each do |t|
  t['date'] ||= ""
  t['price'] ||= ""
  info_string = t['leaders'].collect{ |l| l['name'] }.join(" ") + t['date'] + t['price']
  if info_string.length > 50
    t['info_tag'] = '<trip-info-xxlg>'
  elsif info_string.length > 30
    t['info_tag'] = '<trip-info-xlg>'
  elsif info_string.length > 27
    t['info_tag'] = '<trip-info-lg>'
  elsif info_string.length > 20
    t['info_tag'] = '<trip-info>'
  elsif info_string.length > 10
    t['info_tag'] = '<trip-info-sm>'
  end

  unless t['image_url'].nil?
    img_size = FastImage.size(t['image_url'])
    # scale image, to either 200 px tall
    # or to 580 px wide
    img_h = 200
    img_w = 200 * img_size[0] / img_size[1]

    if img_w > 540
      img_w = 540
      img_h = 540 * img_size[1] / img_size[0]
    end

    t['image_w'] = img_w
    t['image_h'] = img_h
  end

end

cover_size = FastImage.size(@data['cover']['image_url'])
@data['cover']['x'] = 580
@data['cover']['y'] = 580 * cover_size[1] / cover_size[0]


email = ERB.new(template).result(binding)
print email
