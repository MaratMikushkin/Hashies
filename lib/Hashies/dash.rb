module Hashies
  class Dash
    class << self
      attr_accessor :properties
    end
  
    def self.property(current_property, options = {})
      if self.properties == nil
        self.properties = Hash.new
      end
      self.properties[current_property] = options
    end
    
    def initialize(*args)
      @hash = {}
    
      self.class.properties.each do |current_property, options|
        
        if options.has_key?(:required)
          raise ArgumentError if args.empty?
          args.each do |arg|
            if arg.keys.include?(current_property) == false
              raise ArgumentError
            else
              @hash[current_property] = arg[current_property]
              define_singleton_method(current_property) do
                @hash[current_property]
              end
              define_singleton_method("#{current_property.to_s}=".to_sym) do |val|
                raise ArgumentError if val == nil
                @hash[current_property] = val
              end
            end
          end
        end
      end
      
      #define_singleton_method(current_property) do
      #  @hash[current_property]
      #end      
    end
  end
end
