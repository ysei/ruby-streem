require 'streem/streemer'

module Streem
  module Streemers
    class Stdin < Streem::Streemer
      def initialize(*args)
        super
        @closed = false
      end

      def exit_exceptions
        [IOError, EOFError]
      end

      def shutdown
        $stdin.close_read
      end

      private

      def get_next_input
        $stdin.readline().strip
      end
    end
  end
end
