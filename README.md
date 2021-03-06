
## index.html.haml:

```haml


.container
  .row
    .col-lg-12
      %h3 Test formulaire

      = simple_form_for @beer do |f|
        = f.input :name, :class => "form-control", :append => "$"
        = f.input :percentage, as: :integer, :class => "form-control", :prepend => "#"
        = f.input :name, :class => "form-control", :prepend => "un", :append => "et deux"
        = f.input :description, as: :text, :class => "form-control"


```

## [simple_form_addon.rb](https://github.com/lambda2/simple-form-addon/blob/master/config/initializers/simple_form_addon.rb):

```ruby
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

```

## [simple_form_bootstrap.rb](https://github.com/lambda2/simple-form-addon/blob/master/config/initializers/simple_form_bootstrap.rb):


```ruby

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.button_class = 'btn btn-default'
  config.boolean_label_class = nil

  config.wrappers :vertical_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'control-label'


    b.wrapper tag: 'div', class: 'input-group' do |ba|
      ba.use :prepend # Pour le prepend (a gauche)
      ba.use :input, class: 'form-control'
      ba.use :append # Pour le append (a droite)
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  ...

```
