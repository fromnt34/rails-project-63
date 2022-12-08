# frozen_string_literal: true

module HexletCode
  module Html
    module SpecialTags
      module FormInputs
        class Text
          def self.generate(name, options, value)
            options[:name] = name
            options[:cols] ||= 20
            options[:rows] ||= 40

            Html::Tag.generate('textarea', **options) { value }
          end
        end
      end
    end
  end
end
