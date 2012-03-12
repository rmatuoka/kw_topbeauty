require 'test_helper'

class ColorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Color.new.valid?
  end
end
