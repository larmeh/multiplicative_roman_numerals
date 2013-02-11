require 'test/unit'
require 'roman_int'

class TestRoman < Test::Unit::TestCase

  attr_accessor :some_int

  def setup
    @some_int = RomanInt.new
  end

  def test_transform_all_and_back
    (2**8).times { |i|
      assert_equal(i, some_int.int_to_roman(some_int.roman_to_int(i)))
    }
  end

end
