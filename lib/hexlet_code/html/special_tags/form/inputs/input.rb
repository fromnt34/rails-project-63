# frozen_string_literal: true

module HexletCode
  module Html
    module SpecialTags
      module FormInputs
        class Input
          def self.generate(options, value)
            options[:type] ||= 'text'
            options[:value] = value

            Html::Tag.generate :input, **options
          end
        end
      end
    end
  end
end
