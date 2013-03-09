module Bloom
  class Filter
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
