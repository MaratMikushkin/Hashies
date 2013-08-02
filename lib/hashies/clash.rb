module Hashies
  class Clash < Hash
    # def initialize
      # @hash = {}
    # end
    # attr_accessor :hash

    def method_missing(m, *args)
      key = m.to_s[0...-1]

      case m.to_s[-1]
      when '!'
        define_singleton_method(m) do |val|
           # @hash[key.to_sym] = Mash.new unless @hash[key.to_sym]
          self[key.to_sym] = Mash.new unless @hash[key.to_sym]
        end
        # @hash[key.to_sym] = Mash.new unless @hash[key.to_sym]
        self[key.to_sym] = Mash.new unless @hash[key.to_sym]
      else
        define_singleton_method(m) do
          # @hash[m.to_sym] = args[0]
          self[m.to_sym] = args[0]
          self
        end
        # @hash[m.to_sym] = args[0]
        self[m.to_sym] = args[0]
        self
      end
    end

    # def to_ary
      # hash.to_a
      # []
    # end



  end
end