system('rm -f email\*; rm -f yale\*')

line = ""
emails = []
yale_emails = []
bad_emails = []
f = File.open('bad_emails')
while true
  line = f.gets
  break if line.nil?
  b = line.split(', ')
  b.each do |e|
    bad_emails << e.strip
  end
end

f = File.open('bad_emails_line', 'w')
bad_emails.each do |e|
  f.puts e
end

while true
  line = gets
  break if line.nil?
  line = line.strip
  if line[0] == '#' || line == ''
    next
  end
  if line.include?('@yale.edu')
      yale_emails << line unless yale_emails.include?(line) || bad_emails.include?(line)
  else
    emails << line.strip unless emails.include?(line.strip) || bad_emails.include?(line)
  end
end

count = 1
yale_emails.each_slice(1000) do |e|
  f = File.open("yale#{count}", 'w')
  e.each do |a|
    f.print a
    f.print ", "
    puts a
  end
  count += 1
end

count = 1
emails.each_slice(10) do |e|
  f = File.open("foreign#{count}", 'w')
  e.each do |a|
    f.print a
    f.print ", "
    puts a
  end
  count += 1
end

