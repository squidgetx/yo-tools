#!/usr/bin/env ruby
# Parse custom HTML and directives

rowclose = "</td> <td class='expander'></td></tr></table></td></tr></table>"
row = "<table class='row'><tr><td class='wrapper last'><table class='twelve columns'><tr><td>"

directives = {
  'container' => "<table class='container'><tr><td>",
  '/container' => "</td></tr></table>",

  'header /' => "<table class='row'><tr class='header'><td class='wrapper'><table class='eight columns'><tr><td><img width='380px' height='64px' src='https://raw.githubusercontent.com/squidgetx/yo-tools/master/images/logo_1024_alpha_invert.png' /></td><td class='expander'></td></tr></table> </td> <td class='wrapper last'><table class='four columns'></table></td></tr></table>",
  'header-blk /' => "<table class='row'><tr class='header'><td class='wrapper'><table class='eight columns'><tr><td><img width='380px' height='64px' src='https://raw.githubusercontent.com/squidgetx/yo-tools/master/images/logo_1024_alpha.png' /></td><td class='expander'></td></tr></table> </td> <td class='wrapper last'><table class='four columns'></table></td></tr></table>",

  'subtitle' => "<table class='row'><tr><td class='wrapper offset-by-five last'><table class='seven columns'><tr><td><p class='inside subtitle'>",
  '/subtitle' => "</p>" + rowclose,

  'interlude' => "<table class='row'><tr><td class='wrapper offset-by-four last'><table class='eight columns'><tr><td><p class='inside interlude'>",
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
  'trip-title-lg' => "<table class='row'>
                    <tr class='trip-head'>
                      <td class='wrapper'>
                        <table class='eight columns trip2'>
                          <tr class='ttitle'>
                            <td>
                              <p class='ttitle-lg'>",
  'trip-title' => "<table class='row'>
                    <tr class='trip-head'>
                      <td class='wrapper'>
                        <table class='eight columns trip2'>
                          <tr class='ttitle'>
                            <td>
                              <p class='ttitle'>",
  '/trip-title' =>           "</p>
                            </td>
                          </tr>
                        </table>
                      </td>",
  'signup' =>        "<td class='wrapper'>
                        <table class='three columns'>
                          <tr>
                            <td class='nobottom'>
                              <table class='button'>
                                <tr>
                                  <td>
                                    <a href='",
  'signup-lg' =>      "<td class='wrapper'>
                        <table class='three columns'>
                          <tr>
                            <td class='nobottom'>
                              <br />
                              <table class='button'>
                                <tr>
                                  <td>
                                    <a href='",

  '/signup' =>                        "'><span class='btn'>Sign Up</span>
                                    </a>
                                  </td>
                                </tr>
                              </table>         
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td class='wrapper last'>
                        <table class='one column'>
                        </table>
                        </td>
                    </tr>
                  </table>",
  'trip-info' => "<table class='row'>
                    <tr>
                      <td class='wrapper offset-by-five last'>
                        <table class='seven columns'>
                          <tr>
                            <td>
                              <p class='inside tdate'>",
  'leader-email' =>             "<a class='email' href='mailto:",
  'leader-name' =>                "'>",
  '/leader-name' =>             "</a>",
  'tprice' =>                   "| ",
  'tdate' =>                    "| ",
  '/trip-info' =>            "</p>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>",

  'signoff' => "<p class='signoff'>",
  '/signoff' => "</p>",
  'signature' => "<p class='signoff'>&nbsp;&nbsp;&nbsp; - ",
  '/signature' => "</p></td></tr></table></td>",
  'animal' => "<td class='wrapper last'><table class='two columns'><tr><td>",
  '/animal' => "</td></tr></table></td>",
  'trip' => '',
  '/trip' => '',
  '/leader-email' => '',
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


