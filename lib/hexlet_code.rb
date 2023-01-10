# frozen_string_literal: true

module HexletCode
  autoload :VERSION, 'hexlet_code/version'
  autoload :Html, 'hexlet_code/html'
  autoload :Form, 'hexlet_code/form'

  def self.form_for(object, **attributes, &)
    Html.render Form.new(object, **attributes, &)
  end
end
