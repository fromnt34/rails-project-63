# frozen_string_literal: true

require "test_helper"

class TestFormFor < Minitest::Test
  def setup
    @user = nil
  end

  def test_form
    actual_value = HexletCode.form_for(@user).to_s
    expected_value = '<form action="#" method="post"></form>'

    assert { actual_value == expected_value }
  end

  def test_form_with_custom_action
    actual_value = HexletCode.form_for(@user, action: "/test").to_s
    expected_value = '<form action="/test" method="post"></form>'

    assert { actual_value == expected_value }
  end
end
