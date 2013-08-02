module Hashies
  class Trash
    class << self
      attr_accessor :properties
    end

    def self.property(current_property, options = {})
      if self.properties == nil
        self.properties = Hash.new
      end
      self.properties[current_property] = options
    end

    def [](parameter)
      if @hash.has_key?(parameter)
        @hash[parameter]
      else
        raise NoMethodError
      end
    end

    def initialize(*args)
      @hash = {}

      self.class.properties.each do |current_property, options|

        if options.has_key?(:default)
          @hash[current_property] = options[:default]
        end
        def_singleton_methods(current_property)
        args.each do |arg|
            @hash[current_property] = arg[current_property] unless arg[current_property].nil?
        end
        if options.has_key?(:required)
          raise ArgumentError if args.empty?
          args.each do |arg|
            if arg.has_key?(current_property)
              define_singleton_method("#{current_property.to_s}=".to_sym) do |val|
                raise ArgumentError if val == nil
                @hash[current_property] = val
              end
            else
              raise ArgumentError
            end
          end
        end
      end
    end

    def def_singleton_methods(curr_property)
      define_singleton_method(curr_property) do
        @hash[curr_property]
      end
      define_singleton_method("#{curr_property.to_s}=".to_sym) do |val|
        @hash[curr_property] = val
      end
    end
  end
end
