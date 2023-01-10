# frozen_string_literal: true

module HexletCode
  module Html
    module Form
      module Inputs
        class Input
          def self.generate(attrs)
            attrs[:type] ||= 'text'

            ::HexletCode::Html::Tag.new(:input, **attrs).html
          end
        end
      end
    end
  end
end
