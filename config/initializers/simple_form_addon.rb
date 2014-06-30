module SimpleForm
  module Components
    module Addon

      def append(wrapper_options)
        addon(options[:append], wrapper_options[:wrapper])
      end

      def prepend(wrapper_options)
        addon(options[:prepend], wrapper_options[:wrapper])
      end

      def has_append?
        options[:append].present?
      end

      def has_prepend?
        options[:prepend].present?
      end

      def addon(content, wrapper)
        if options.include? :append or options.include? :prepend
          wrapper.find(:input_wrapper).setInputGroup() if wrapper.find(:input_wrapper)
        else
          wrapper.find(:input_wrapper).unsetInputGroup() if wrapper.find(:input_wrapper)
          nil
        end

        if content
          "<span class=\"input-group-addon\">#{content.to_s.html_safe}</span>"
        end
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Addon)
