# frozen_string_literal: true

require "test_helper"

class HTMLAttribute < Minitest::Test
  def test_is_class
    assert_instance_of Class, HTML::Attribute
  end

  def test_to_s
    assert { HTML::Attribute.new("class", "test-class").to_s == 'class="test-class"' }
  end
end
