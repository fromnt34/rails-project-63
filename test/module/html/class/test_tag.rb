# frozen_string_literal: true

require 'test_helper'

class TestHTMLTag < Minitest::Test
  def test_class?
    assert_instance_of Class, HTML::Tag
  end

  def test_to_s
    assert { HTML::Tag.new('img').to_s == '<img>' }
  end

  def test_close_tag_to_s
    assert { HTML::Tag.new('div').to_s == '<div></div>' }
  end
end
