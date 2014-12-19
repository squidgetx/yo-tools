panlist = []
count0 = 0
while true
  line = gets
  break if line.nil?
  count0 += 1
  line = line.strip.downcase
  next if line[0,1] == "#" # comment
  next if line.empty?
  unless panlist.include?(line) # yay linear search :(
    panlist << line
  end
end
count = 0
panlist = panlist.sort_by {
  |p| p
}
panlist.each do |p|
  count += 1
  print "#{p}"
  print ", " if p != panlist.last
end
puts ""

$stderr.puts "#{count} emails processed, #{count0 - count} duplicates removed"





    

