#!/usr/bin/env ruby
$: << File.expand_path('../../lib', __FILE__)

require 'streem'

# most fundamental Streem program
# build pipeline from stdin to stdout

stdin | stdout

# actual stream processing will happen in the event loop
# that starts after all program execution.
