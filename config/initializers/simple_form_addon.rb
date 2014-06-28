module SimpleForm
  module Components
    module Addon

      def append
        addon(options[:append])
      end

      def prepend
        addon(options[:prepend])
      end

      def has_append?
        append.present?
      end

      def has_prepend?
        prepend.present?
      end

      def addon(content)
        if content
          "<span class=\"input-group-addon\">#{content.to_s.html_safe}</span>"
        end
      end

    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Addon)
