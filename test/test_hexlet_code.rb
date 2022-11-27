# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_is_module
    assert_instance_of Module, HexletCode
  end
end
