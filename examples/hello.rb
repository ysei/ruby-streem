#!/usr/bin/env ruby
$: << File.expand_path('../../lib', __FILE__)

require 'streem'

instreem = Streem::Pipe.new
instreem | ->(x) { print "Hello\n"; x } | stdout
instreem << 'World'
