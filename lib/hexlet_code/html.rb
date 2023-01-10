# frozen_string_literal: true

module HexletCode
  module Html
    autoload :Form, 'hexlet_code/html/form'
    autoload :Tag, 'hexlet_code/html/tag'

    def self.render_input(input)
      return Tag.new(:input, **input).html if input[:type] == :submit

      name = input[:name]
      label = Tag.new(:label, for: name) { name.capitalize }.html

      type = input.fetch(:as, 'input').capitalize
      input = const_get("Form::Inputs::#{type}").generate(input.except(:as))

      label + input
    end

    def self.render(form)
      inputs = form.inputs
      rendered_inputs = inputs.map { |i| render_input i }

      Tag.new(:form, **form.attrs) { rendered_inputs.join }.html
    end
  end
end
