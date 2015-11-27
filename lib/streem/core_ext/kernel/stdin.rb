require 'streem/streemers/stdin'

module Kernel
  def stdin
    Streem::Streemers::Stdin.new
  end
end
