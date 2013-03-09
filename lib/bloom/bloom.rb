module Bloom
  class Bloom
    DEFAULTS = {
      m: 256,
      k: 8
    }
    attr_reader :bitfield
    attr_reader :k
    attr_reader :m

    def initialize(options = {})
      @m = options[:m] || DEFAULTS[:m]
      @k = options[:k] || DEFAULTS[:k]
      @bitfield = 0
    end

  end
end
