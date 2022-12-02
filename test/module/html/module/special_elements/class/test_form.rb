# frozen_string_literal: true

require "test_helper"

class TestForm < TestHelper
  def test_class?
    assert_instance_of Class, HTML::SpecialElements::Form
  end

  def setup
    @user = User.new name: "Jarad", job: "Grade A", gender: "m"
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

  def test_form_inputs
    actual_value = HTML::SpecialElements::Form.new @user do |f|
      f.input :name, class: "test-class", id: "test-id"
      f.input :job, id: "test-id"
      f.input :job, as: :text
    end.to_s

    # TODO: make possible to test with formated html
    expected_value = load_fixture("module/html/module/special_elements/class/test_form/form_inputs.html")

    assert { actual_value == expected_value }
  end

  def test_form_input_error_on_undefined_method_in_user
    assert_raises NoMethodError do
      HTML::SpecialElements::Form.new @user do |f|
        f.input :age
      end
    end
  end

  def test_form_button
    actual_value = HTML::SpecialElements::Form.new(@user, &:submit).to_s

    expected_value = '<form action="#" method="post"><input type="submit" value="Save"></form>'

    assert { actual_value == expected_value }
  end

  def test_form_button_with_custom_value
    actual_value = HTML::SpecialElements::Form.new @user do |f|
      f.submit "test"
    end.to_s

    expected_value = '<form action="#" method="post"><input type="submit" value="test"></form>'

    assert { actual_value == expected_value }
  end
end
