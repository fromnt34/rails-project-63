# frozen_string_literal: true

require "test_helper"

class TestTag < Minitest::Test
  def test_tag
    assert { HexletCode::Tag.build("img") == "<img>" }
  end

  def test_attributes
    actual_value = HexletCode::Tag.build("img", src: "path/to/image", alt: "Alt text")
    expected_value = '<img src="path/to/image" alt="Alt text">'

    assert { actual_value == expected_value }
  end

  def test_close_tag
    assert { HexletCode::Tag.build("div") == "<div></div>" }
  end

  def test_content
    assert { HexletCode::Tag.build("div") { "Test content" } == "<div>Test content</div>" }
  end
end
