module Hamster

  class Entry

    attr_reader :key, :value

    def initialize(key, value)
      @key = key
      @value = value
    end

    def has_key?(key)
      @key.eql?(key)
    end

  end

end