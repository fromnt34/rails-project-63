# frozen_string_literal: true

module HexletCode
  module Form
    module FormInputs
      class Input
        def self.generate(options, value)
          options[:type] ||= 'text'
          options[:value] = value

          RenderObject.new :input, **options
        end
      end
    end
  end
end
