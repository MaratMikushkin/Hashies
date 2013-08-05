module Hashies
  class Clash < Hash
    class << self
      attr_accessor :parent
    end

    def method_missing(m, *args)
      key = m.to_s[0...-1]

      case m.to_s[-1]
      when '!'
        if m.to_s != "_end!"
          self[key.to_sym] = Clash.new
          self[key.to_sym].class.parent= self
          return self[key.to_sym]
        else
          return self.class.parent
        end
      else
        define_singleton_method(m) do |val|
          if self.has_key?(m.to_sym)
            puts "self[m.to_sym] #{self[m.to_sym]} #{val}"
            self[m.to_sym][val.keys[0]] = val.values[0]
          else
            self[m.to_sym] = val
          end
          self
        end
        self[m.to_sym] = args[0]
        self
      end
    end
  end
end
