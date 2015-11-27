module Kernel
  def stdout
    Streem::Pipe.new { |s| print "#{s}\n"; s }
  end
end
