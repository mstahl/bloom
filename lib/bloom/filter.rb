module Bloom
  class Filter
    attr_reader :bitfield
    attr_reader :k
    attr_reader :m
    attr_reader :n

    def add(obj)
      bitfield_positions(obj).each do |position|
        @bitfield.set(position)
      end
      @n += 1
    end
    alias :<< :add

    def false_positive_probability
      (1 - Math.exp(-@k * (@n + 0.5) / (@m - 1))) ** @k
    end

    def initialize(options = {})
      @n = 0
      @m = options[:m] || DEFAULTS[:m]
      @k = options[:k] || DEFAULTS[:k]
      @bitfield = Bitfield.new
      @salt = rand(0xFFFFffffFFFFffff)
    end

    def include?(obj)
      bitfield_positions(obj).each do |position|
        return false unless @bitfield.get(position)
      end
      return true
    end

    private

    def bitfield_positions(obj)
      (0..@k).map do |k|
        (0..k).inject(obj.hash) {|h, _| (h + @salt).hash} % @m
      end
    end

  end
end
