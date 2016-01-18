#!/bin/bash
set -x
sass style.scss:style.css;
bin/read_json.rb | bin/builder.rb | bin/process.rb
bin/sendmail.rb $1 $2;
bin/cleanup.sh
