module Kernel
  def streem
    streemline = yield
    streemline.streem
  end
end
