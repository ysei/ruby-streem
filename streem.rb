# An implementation of Streem in Ruby
# H26.12/17 SUZUKI Hisao (suzuki611@oki.com, suzuki@acm.org)
# cf. https://github.com/matz/streem

# seq(5) .| {|x| x + 10} | TO_ARRAY # => [11, 12, 13, 14, 15]

class Streem
  include Enumerable

  def |(rhs=nil)
    if rhs.nil?
      return Iter.new {|y|
        each {|e|
          y[yield e]
        }
      }
    else
      return rhs[self]
    end
  end
end


class Iter < Streem
  def initialize(&block)
    @block = block
  end

  def each(&y)
    @block[y]
    return
  end
end


class Seq < Streem
  def initialize(source)
    case source
    when Enumerable
      @source = source
    when Integer
      @source = 1..source
    else
      raise ArgumentError.new(source)
    end
  end

  def each(&y)
    @source.each &y
    return
  end
end

def seq(x)
  return Seq.new(x)
end


# cf. https://github.com/matz/streem/issues/16
def zip(a, b)                   # => [a1, b1], [a2, b2], ..., [an, bn]
  return Iter.new {|y|
    gen = b.to_enum
    a.each {|ai|
      begin
        bi = gen.next
      rescue StopIteration
        break
      end
      y[[ai, bi]]
    }
  }
end

# cf. https://github.com/matz/streem/issues/16
def cat(a, b)                   # => a1, a2, ..., an, b1, b2, ... bn
  return Iter.new {|y|
    a.each {|e| y[e]}
    b.each {|e| y[e]}
  }
end


TO_ARRAY = ->seq {              # => [a1, a2, .., an]
  return seq.to_a
}

STD_OUT = ->seq {
  seq.each {|e|
    printf("%s\n", e)
  }
}

STD_IN = Iter.new {|y|
  while line = ARGF.gets
    y[line]
  end
}

# Copyright (c) 2014 OKI Software Co., Ltd.
# 
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
