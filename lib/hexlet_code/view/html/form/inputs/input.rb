# frozen_string_literal: true

module HexletCode
  module View
    module Html
      module Form
        module Inputs
          class Input
            def self.generate(attrs)
              attrs[:type] ||= 'text'

              ::HexletCode::Form.render_object :input, **attrs
            end
          end
        end
      end
    end
  end
end
