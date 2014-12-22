#!/bin/bash
set -x
sass style.scss:style.css;
bin/builder.rb | bin/process.rb;
bin/testmail.rb;
bin/cleanup.sh
