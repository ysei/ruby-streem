module Streem
  class Pipe

    def initialize(&action)
      @outstreem = nil
      @action = action if block_given?
    end

    def terminal?
      @outstreem.nil?
    end

    def <<(data)
      data = @action.call(data) if @action
      @outstreem << data if @outstreem
    end

    def |(outstreem)
      raise RuntimeError.new('already connected') if @outstreem
      raise RuntimeError.new('cannot connect a streemer') if outstreem.is_a?(Streem::Streemer)

      @outstreem = factory(outstreem)
    end

    private

    def factory(pipe)
      pipe.is_a?(Proc) ? Pipe.new(&pipe) : pipe
    end
  end
end
