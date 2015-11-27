#!/usr/bin/env ruby

$: << File.expand_path('../../lib', __FILE__)

require 'streem'

instreem = Streem::Pipe.new

instreem | ->(x) { print "foo\n"; x } | stdout

instreem << 'Hello'

stdin = Streem::Streemers::Stdin.new
stdin | stdout
stdin.streem

#streem do
#  stdin | stdout
#end
