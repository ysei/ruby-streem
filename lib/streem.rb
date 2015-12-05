require 'streem/version'

require 'streem/globals'

require 'streem/streemer'
require 'streem/streemers'
require 'streem/core_ext/kernel.rb'

at_exit do
  shutdown = ->(signo) { Streem::STREEMERS.each { |s| s.shutdown } }
  Signal.trap('INT', shutdown)
  Signal.trap('TERM', shutdown)


  streems = Streem::STREEMERS.collect do |streemer|
    Thread.new { streemer.streem }
  end

  streems.each(&:join)
end
