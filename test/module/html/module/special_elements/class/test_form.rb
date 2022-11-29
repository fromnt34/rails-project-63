# frozen_string_literal: true

require "test_helper"

class TestForm < Minitest::Test
  def test_is_class
    assert_instance_of Class, HTML::SpecialElements::Form
  end

  def setup
    @user = nil
  end

  def test_form
    actual_value = HTML::SpecialElements::Form.new(@user).to_s
    expected_value = '<form action="#" method="post"></form>'

    assert { actual_value == expected_value }
  end

  def test_form_with_custom_action
    actual_value = HTML::SpecialElements::Form.new(@user, action: "/test").to_s
    expected_value = '<form action="/test" method="post"></form>'

    assert { actual_value == expected_value }
  end
end
