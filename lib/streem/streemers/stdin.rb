require 'streem/streemer'

module Streem
  module Streemers
    class Stdin < Streem::Streemer
      def streem
        raise RuntimeError.new('not connected') unless @outstreem

        begin
          loop do
            @outstreem << $stdin.readline().strip
          end
        rescue EOFError
          # exit gracefully
        end
      end
    end
  end
end
