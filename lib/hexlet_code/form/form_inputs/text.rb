# frozen_string_literal: true

module HexletCode
  module Form
    module FormInputs
      class Text
        def self.generate(options, value)
          options[:cols] ||= 20
          options[:rows] ||= 40

          RenderObject.new(:textarea, **options) { value }
        end
      end
    end
  end
end
