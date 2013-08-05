module Hashies
  class Clash < Hash
    # def initialize
      # @hash = {}
    # end
    # attr_accessor :hash
    class << self
      attr_accessor :parent
    end

    def method_missing(m, *args)
      key = m.to_s[0...-1]

      case m.to_s[-1]
      when '!'
        #define_singleton_method(m) do |val|
        #  self[key.to_sym] = Mash.new unless @hash[key.to_sym]
        #end
        #self[key.to_sym] = Mash.new unless @hash[key.to_sym]
        if m.to_s != "_end!"
          self[key.to_sym] = Clash.new
          self[key.to_sym].class.parent= self
          return self[key.to_sym]
        else
          puts "_end! #{self}"
          return self.class.parent
        end
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
