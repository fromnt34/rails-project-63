# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/module/html/html"

module HexletCode
  include HTML

  class Tag
    def self.build(tag, **attributes)
      if block_given?
        (HTML::Element.new(tag, **attributes) { "Test content" }).to_s
      else
        HTML::Element.new(tag, **attributes).to_s
      end
    end
  end
end
