# frozen_string_literal: true

module HexletCode
  module Html
    module Form
      module Inputs
        class Text
          def self.generate(attrs)
            attrs[:cols] ||= 20
            attrs[:rows] ||= 40

            ::HexletCode::Html::Tag.new(:textarea, **attrs.except(:value)) { attrs[:value] }.html
          end
        end
      end
    end
  end
end
