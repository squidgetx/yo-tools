#!/usr/bin/env ruby
# Parse custom HTML and directives

rowclose = "</td> <td class='expander'></td></tr></table></td></tr></table>"
row = "<table class='row'><tr><td class='wrapper last'><table class='twelve columns'><tr><td class=''>"

directives = {
  'container' => "<table class='container'><tr><td>",
  '/container' => "</td></tr></table>",

  'header' => "<table class='row'><tr class='header'><td class='center' align='center'><center><table class='container'><tr class='header'><td class='wrapper'><table class='seven columns'><tr><td class='text-pad-lg'>",
  '/header' => "</td><td class='expander'></td></tr></table> </td> <td class='wrapper last'><table class='five columns'></table></td></tr></table></center></td></tr></table>",

  'subtitle' => "<table class='row'><tr><td class='wrapper offset-by-five last'><table class='seven columns'><tr><td><p class='inside subtitle'>",
  '/subtitle' => "</p>" + rowclose,

  'interlude' => "<table class='row'><tr><td class='wrapper offset-by-five last'><table class='seven columns'><tr><td><p class='inside interlude'>",
  '/interlude' => "</p>" + rowclose,

  'quotebox' => "<table class='row'><tr><td class='wrapper last'><table class='nine columns'><tr class = 'quoteback'><td class='text-pad'><br />",
  '/quotebox' => rowclose,

  'quote' => "<p class='quoteback'><i>\"",
  '/quote' => "\"</i></p>",

  'quotee' => "<p class='quoteback'>&nbsp;&nbsp;&nbsp;&nbsp;- ",
  '/quotee' => "</p>",

  'row-accent' => "<table class='row'><tr class='accent'><td class='wrapper last'><table class='twelve columns'><tr><td class=''>",
  'row-accent2' => "<table class='row'><tr class='accent2'><td class='wrapper last'><table class='twelve columns'><tr><td class=''>",

  'row' => row,
  '/row' => rowclose,

  'footer' => "<table class='row'><tr class='signoff'><td class='wrapper'><table class='ten columns'><tr><td class='text-pad'><br />",
  '/footer' => rowclose,

  'trip-title' => "<table class='row accent-mid'><tr><td class='wrapper'><table class='nine columns'><tr><td><h3>",
  '/trip-title' => '</h3></td></tr></table></td>',
  'trip-date' => "<td class='wrapper last'><table class='three columns'><tr><td><p class='date'>",
  '/trip-date' => '</p></td></tr></table></td></tr></table>',
  'trip-desc' => "<table class='row'><tr><td class='wrapper'><table class='eight columns'><tr><td class=''><p>",
  '/trip-desc' => "</p></td></tr></table></td>",
  'trip-pic' => "<td class='wrapper last'><table class='four columns'><tr><td>",
  '/trip-pic' => "</td></tr></table></td></tr></table>",

  'signoff' => "<p class='signoff'>",
  '/signoff' => "</p>",
  'signature' => "<p class='signoff'>&nbsp;&nbsp;&nbsp; - ",
  '/signature' => "</p></td></tr></table></td>",
  'animal' => "<td class='wrapper last'><table class='two columns'><tr><td>",
  '/animal' => "</td></tr></table></td>"
}

while (true)
  line = $stdin.gets
  break if line.nil?
  line = line.strip
  if line[0,1] == '<' && line[line.length - 1, line.length] == '>' 
    tag = line[1,line.length - 2]
    if directives[tag]
      puts directives[tag]
    elsif tag == "subject"
      File.open("subject","w") do |out|
        out.puts $stdin.gets
      end
      $stdin.gets # flush following subject line
    else
      puts line
    end
    next
  end
  puts line
end


