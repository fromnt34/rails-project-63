# frozen_string_literal: true

module HexletCode
  module View
    module Html
      module Form
        module Inputs
          class Text
            def self.generate(options)
              options[:cols] ||= 20
              options[:rows] ||= 40

              ::HexletCode::Form.render_object(:textarea, **options.except(:value)) { options[:value] }
            end
          end
        end
      end
    end
  end
end
