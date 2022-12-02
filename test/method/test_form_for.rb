# frozen_string_literal: true

require "test_helper"

class TestFormFor < TestHelper
  def test_method?
    assert { HexletCode.singleton_class.method_defined?(:form_for, false) }
  end

  def test_form
    actual_value = HexletCode.form_for @user
    expected_value = '<form action="#" method="post"></form>'

    assert { actual_value == expected_value }
  end

  def test_form_with_custom_action
    actual_value = HexletCode.form_for @user, action: "/test"
    expected_value = '<form action="/test" method="post"></form>'

    assert { actual_value == expected_value }
  end

  def setup
    @user = User.new name: "Jarad", job: "Grade A", gender: "m"
  end

  def test_form_inputs
    actual_value = HexletCode.form_for @user do |f|
      f.input :name, class: "test-class", id: "test-id"
      f.input :job, id: "test-id"
      f.input :job, as: :text
    end

    expected_value = load_fixture("method/test_form_for/form_inputs.html")

    # TODO: make possible to test with formated html
    assert { actual_value.gsub(/\s+/, "") == expected_value.gsub(/\s+/, "") }
  end

  def test_form_input_error_on_undefined_method_in_user
    assert_raises NoMethodError do
      HexletCode.form_for @user do |f|
        f.input :age
      end
    end
  end

  def test_form_button
    actual_value = HTML::SpecialElements::Form.new(@user, &:submit).to_s

    expected_value = load_fixture("method/test_form_for/form_button.html")

    assert { actual_value.gsub(/\s+/, "") == expected_value.gsub(/\s+/, "") }
  end

  def test_form_button_with_custom_value
    actual_value = HTML::SpecialElements::Form.new @user do |f|
      f.submit "test"
    end.to_s

    expected_value = load_fixture("method/test_form_for/form_button_with_custom_value.html")

    assert { actual_value.gsub(/\s+/, "") == expected_value.gsub(/\s+/, "") }
  end
end
