#!/usr/bin/env ruby
# Parse custom HTML and directives

rowclose = "</td> <td class='expander'></td></tr></table></td></tr></table>"

directives = {
  'container' => "<table class='container'><tr><td>",
  '/container' => "</td></tr></table>",

  'header' => "<table class='row'><tr class='header'><td class='wrapper last'><table class='seven columns'><tr><td class='text-pad-lg'>",
  '/header' => "</td><td class='expander'></td></tr></table> </td> <td class='wrapper last'><table class='five columns'></table></td></tr></table>",

  'subtitle' => "<table class='row'><tr><td class='wrapper offset-by-five last'><table class='seven columns'><tr><td><p class='inside subtitle'>",
  '/subtitle' => "</p>" + rowclose,

  'quotebox' => "<table class='row'><tr><td class='wrapper last'><table class='nine columns'><tr class = 'quoteback'><td class='text-pad'><br />",
  '/quotebox' => rowclose,

  'quote' => "<p class='quoteback'><i>",
  '/quote' => "</i></p>",

  'quotee' => "<p class='quoteback'>&nbsp;&nbsp;&nbsp;&nbsp;- ",
  '/quotee' => "</p>",

  'row' => "<table class='row'><tr><td class='wrapper last'><table class='twelve columns'><tr><td class='text-pad'>",
  '/row' => rowclose,

  'footer' => "<table class='row'><tr class='signoff'><td class='wrapper'><table class='ten columns'><tr><td class='text-pad'><br />",
  '/footer' => rowclose,

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


