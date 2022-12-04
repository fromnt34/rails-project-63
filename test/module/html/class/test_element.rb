# frozen_string_literal: true

require 'test_helper'

class TestHTMLElement < Minitest::Test
  def test_class?
    assert_instance_of Class, HTML::Element
  end

  def test_to_s
    assert { HTML::Element.new('img').to_s == '<img>' }
  end

  def test_attributes
    actual_value = HTML::Element.new('img', src: 'path/to/image', alt: 'Alt text').to_s
    expected_value = '<img src="path/to/image" alt="Alt text">'

    assert { actual_value == expected_value }
  end

  def test_close_tag_to_s
    assert { HTML::Element.new('div').to_s == '<div></div>' }
  end

  def test_content
    assert { (HTML::Element.new('div') { 'Test content' }).to_s == '<div>Test content</div>' }
  end
end
