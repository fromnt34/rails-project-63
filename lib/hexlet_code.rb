# frozen_string_literal: true

module HexletCode
  autoload :VERSION, 'hexlet_code/version'
  autoload :View, 'hexlet_code/view'
  autoload :Form, 'hexlet_code/form'

  def self.form_for(object, **attributes, &)
    View::Html.render Form.generate(object, **attributes, &)
  end
end
