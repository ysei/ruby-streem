require 'streem/pipe'

module Streem
  class Streemer < Pipe

    def initialize
      super(&:nil)
      @streemers = []
    end

    def |(outstreem)
      outstreem = factory(outstreem)
      @streemers.last | outstreem
      @streemers << outstreem
      @outstreem ||= @streemers.first
      self
    end

    def streem
      raise NotImplementedError
    end

    private :<<
  end
end
