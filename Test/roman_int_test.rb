require 'test/unit'
require 'roman_int'

class TestRoman < Test::Unit::TestCase

  attr_accessor :converter

  def setup
    @converter = RomanInt.new
  end

  def test_tokens
    assert_equal(converter.int_to_roman(0), "")
    assert_equal(converter.int_to_roman(1), "I")
    assert_equal(converter.int_to_roman(4), "IV")
    assert_equal(converter.int_to_roman(5), "V")
    assert_equal(converter.int_to_roman(9), "IX")
    assert_equal(converter.int_to_roman(10), "X")
    assert_equal(converter.int_to_roman(40), "XL")
    assert_equal(converter.int_to_roman(50), "L")
    assert_equal(converter.int_to_roman(90), "XC")
    assert_equal(converter.int_to_roman(100), "C")
    assert_equal(converter.int_to_roman(400), "CD")
    assert_equal(converter.int_to_roman(500), "D")
    assert_equal(converter.int_to_roman(900), "CM")
    assert_equal(converter.int_to_roman(1000), "M")
  end

  def test_transform_all_and_back
    (2**8).times { |i|
      assert_equal(i, converter.int_to_roman(converter.roman_to_int(i)))
    }
  end

end