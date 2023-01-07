# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < TestHelper
  def setup
    @user = User.new name: 'Jarad', job: 'Grade A', gender: 'm'
  end

  # TODO: make tests not by comparing strings

  def test_form
    actual_value = HexletCode.form_for @user
    expected_value = '<form action="#" method="post"></form>'

    assert { actual_value == expected_value }
  end

  def test_form_with_custom_attributes
    actual_value = HexletCode.form_for @user, url: '/test', method: 'test'
    expected_value = '<form action="/test" method="test"></form>'

    assert { actual_value == expected_value }
  end

  def test_form_inputs
    actual_value = HexletCode.form_for @user do |f|
      f.input :name, class: 'test-class', id: 'test-id'
      f.input :job, type: 'test', id: 'test-id'
      f.input :job, as: :text
    end

    expected_value = load_fixture('form_inputs.html')

    assert { actual_value.gsub(/\s+/, '') == expected_value.gsub(/\s+/, '') }
  end

  def test_form_input_error_on_undefined_method_in_user
    assert_raises NoMethodError do
      HexletCode.form_for @user do |f|
        f.input :age
      end
    end
  end

  def test_form_button
    actual_value = HexletCode.form_for(@user, &:submit)
    expected_value = load_fixture('form_button.html')

    assert { actual_value.gsub(/\s+/, '') == expected_value.gsub(/\s+/, '') }
  end

  def test_form_button_with_custom_value
    actual_value = HexletCode.form_for @user do |f|
      f.submit 'test'
    end

    expected_value = load_fixture('form_button_with_custom_value.html')

    assert { actual_value.gsub(/\s+/, '') == expected_value.gsub(/\s+/, '') }
  end
end
