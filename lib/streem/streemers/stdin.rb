require 'streem/streemer'

module Streem
  module Streemers
    class Stdin < Streem::Streemer
      def initialize(*args)
        super
        @closed = false
      end

      def streem
        raise RuntimeError.new('not connected') unless @outstreem

        begin
          loop do
            @outstreem << $stdin.readline().strip
          end
        rescue IOError, EOFError
          # exit gracefully
        end
      end

      def shutdown
        $stdin.close_read
      end
    end
  end
end
