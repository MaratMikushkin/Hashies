module Hashies
  class Mash
    def initialize
      @hash = {}
    end

    def method_missing(m, *args)
      key = m.to_s[0...-1]

      case m.to_s[-1]
      when '='
        define_singleton_method(m) do |val|
          @hash[key.to_sym] = val
        end
      when '?'
        define_singleton_method(m) do
          return @hash[key.to_sym] != nil ? true : false
        end
      when '!'
        define_singleton_method(m) do
          @hash[key.to_sym] = Mash.new unless @hash[key.to_sym]
          return @hash[key.to_sym]
        end
      when '_'
        define_singleton_method(m) do
          @hash[key.to_sym]
        end
      else
        define_singleton_method(m) do
          @hash[m.to_sym]
        end
      end
      send m, *args
    end
  end
end
