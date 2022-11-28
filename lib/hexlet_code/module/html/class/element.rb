# frozen_string_literal: true

module HTML
  class Element
    def initialize(tag, **attributes)
      @tag = Tag.new tag

      @attributes = attributes_to_instances attributes unless attributes.empty?

      @content = yield if block_given?
    end

    def to_s
      @tag.attributes = attributes_to_html @attributes unless @attributes.nil?

      if @content.nil?
        @tag.to_s
      else
        @tag.open_tag + @content + @tag.close_tag
      end
    end

    private

    def attributes_to_instances(attributes)
      attributes.each_with_object [] do |attribute, accumulator|
        name = attribute[0]
        value = attribute[1]

        accumulator << Attribute.new(name, value)
      end
    end

    def attributes_to_html(attributes)
      attributes.map(&:to_s).join " "
    end
  end
end
