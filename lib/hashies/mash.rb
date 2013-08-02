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
          @hash[key.to_sym] = val[0]
        end
        @hash[key.to_sym] = args[0]
      when '?'
        define_singleton_method(m) do |val|
          return @hash[key.to_sym] != nil ? true : false
        end
        return @hash[key.to_sym] != nil ? true : false
      when '!'
        define_singleton_method(m) do |val|
          @hash[key.to_sym] = Mash.new unless @hash[key.to_sym]
        end
        @hash[key.to_sym] = Mash.new unless @hash[key.to_sym]
      when '_'
        define_singleton_method(m) do
          @hash[key.to_sym]
        end
        @hash[key.to_sym]
      else
        define_singleton_method(m) do
          @hash[m.to_sym]
        end
        @hash[m.to_sym]
      end
    end
  end
end
