module Bloom
  class Bitfield
    attr_reader :binary

    def initialize(binary = 0)
      @binary = binary
    end

    def get(i)
      @binary & (1 << i) != 0
    end

    def set(i)
      @binary |= 1 << i
    end

  end
end
