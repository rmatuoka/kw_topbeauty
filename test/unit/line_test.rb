require 'test_helper'

class LineTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Line.new.valid?
  end
end
