module Streem
  class Pipe

    DEFAULT_ACTION = ->(s) { s }

    def initialize(&action)
      @outstreem = nil
      @action = action || DEFAULT_ACTION
    end

    def terminal?
      @outstreem.nil?
    end

    def <<(data)
      result = @action.call(data)
      @outstreem << result if @outstreem
    end

    def |(outstreem)
      raise RuntimeError.new('already connected') if @outstreem
      if outstreem.is_a?(Proc)
        @outstreem = Pipe.new(&outstreem)
      else
        @outstreem = outstreem
      end
      @outstreem
    end
  end
end
