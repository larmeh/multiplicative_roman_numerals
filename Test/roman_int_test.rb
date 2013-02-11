require 'test/unit'
require 'roman_int'

class TestRoman < Test::Unit::TestCase

  attr_accessor :converter

  def setup
    @converter = RomanInt.new
  end

  def test_transform_all_and_back

  def test_transform_all_and_back
    (2**8).times { |i|
      assert_equal(i, converter.int_to_roman(converter.roman_to_int(i)))
    }
  end

end
