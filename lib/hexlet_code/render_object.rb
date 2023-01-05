# frozen_string_literal: true

class RenderObject
  attr_reader :tag, :attrs, :body

  def initialize(tag, **attrs, &body)
    @tag = tag
    @attrs = attrs
    @body = body ? [body.call] : []
  end

  def push(*values)
    @body.push(*values)
  end
end
