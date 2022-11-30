# frozen_string_literal: true

module HTML
  class Tag
    attr_accessor :attributes

    # rubocop:disable Style/ClassVars
    @@template = "<%<tag>s%<attributes>s>"
    @@close_tag_template = "</%s>"

    @@close_tags = %i[label div form textarea]
    # rubocop:enable Style/ClassVars

    def initialize(name)
      @name = name
    end

    def open_tag
      format @@template, { tag: @name, attributes: build_attributes(@attributes) }
    end

    def close_tag
      format @@close_tag_template, @name
    end

    def to_s
      intermediate_build = format @@template, { tag: @name, attributes: build_attributes(@attributes) }

      if @@close_tags.include? @name.to_sym
        intermediate_build + format(@@close_tag_template, @name)
      else
        intermediate_build
      end
    end

    private

    def build_attributes(attributes)
      attributes.nil? ? "" : " #{attributes}"
    end
  end
end
