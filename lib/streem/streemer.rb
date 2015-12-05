require 'streem/globals'
require 'streem/pipe'

module Streem
  class Streemer < Pipe

    class << self
      alias_method :original_new, :new
      private :original_new

      def new
        this = original_new
        Streem::STREEMERS << this
        this
      end
    end

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

    def shutdown
      raise NotImplementedError
    end

    private :<<
  end
end
