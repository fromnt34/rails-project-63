# frozen_string_literal: true

require "test_helper"

class TestHTML < Minitest::Test
  def test_module?
    assert_instance_of Module, HTML
  end
end
