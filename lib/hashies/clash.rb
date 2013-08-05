module Hashies
  class Clash < Hash
    class << self
      attr_accessor :parent
    end

    def method_missing(called_method, *args)
      method_type = called_method.to_s[-1]
      case method_type
      when '!'
        method = called_method.to_s[0...-1].to_sym
        if method.to_s == "_end"
          return self.class.parent
        else
          self[method] = Clash.new
          self[method].class.parent= self
          return self[method]
        end
      else
        define_singleton_method(called_method) do |val|
          if self.has_key?(called_method)
            val.each { |key, value| self[called_method][key] = value}
          else
            self[called_method] = val
          end
          self
        end
        self[called_method] = args[0]
        self
      end
    end
  end
end
