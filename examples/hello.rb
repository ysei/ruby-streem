#!/usr/bin/env ruby

$: << File.expand_path('../../lib', __FILE__)

require 'streem'

def stdout
  Streem::Pipe.new { |s| print "#{s}\n"; s }
end

instreem = Streem::Pipe.new

instreem | ->(x) { print "foo\n"; x } | stdout

instreem << 'Hello'

#streem do
#  stdin | stdout
#end
