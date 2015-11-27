require 'streem/pipe'

module Streem
  class Streemer < Pipe

    def initialize
      super(&:nil)
    end

    def streem
      raise NotImplementedError
    end

    private :<<
  end
end
