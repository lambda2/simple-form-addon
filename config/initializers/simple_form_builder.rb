module SimpleForm
  module Wrappers
    class Builder

      def find(name)
        @components.each do |c|
          if c.is_a?(Symbol)
            return nil if c == namespace
          elsif value = c.find(name)
            return value
          end
        end
        nil
      end

    end

    class Many

      def setInputGroup
        className = "input-group"
        @defaults[:class] << className unless className.in? @defaults[:class]
      end

      def unsetInputGroup
        className = "input-group"
        @defaults[:class] = @defaults[:class].delete_if {|e| e == className}
      end

    end
  end
end
