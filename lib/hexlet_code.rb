# frozen_string_literal: true

module HexletCode
  autoload :VERSION, 'hexlet_code/version'
  autoload :Html, 'hexlet_code/html'

  def self.form_for(user, **attributes, &)
    Html::SpecialTags::Form.new(user, **attributes, &).to_s
  end
end
