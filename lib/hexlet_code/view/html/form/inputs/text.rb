# frozen_string_literal: true

module HexletCode
  module View
    module Html
      module Form
        module Inputs
          class Text
            def self.generate(attrs)
              attrs[:cols] ||= 20
              attrs[:rows] ||= 40

              ::HexletCode::Form.render_object(:textarea, **attrs.except(:value)) { attrs[:value] }
            end
          end
        end
      end
    end
  end
end
