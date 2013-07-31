module Hashies
  class Mash
      def initialize
        @hash = {}
      end
      
      def method_missing(m, *args)
        key = m.to_s[0...-1]

        case m.to_s[-1]
        when '='
          @hash[key.to_sym] = args[0]
        when '?'
          return @hash[key.to_sym] != nil ? true : false
        when '!'
          #
        when '_'
          #
        else
          # puts @hash
          @hash[m.to_sym]
        end
      end
  end
end