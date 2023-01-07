# frozen_string_literal: true

module HexletCode
  module View
    module Html
      module Form
        module Inputs
          class Input
            def self.generate(options)
              options[:type] ||= 'text'

              ::HexletCode::Form.render_object :input, **options
            end
          end
        end
      end
    end
  end
end
