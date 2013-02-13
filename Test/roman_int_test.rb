require 'test/unit'
require '../roman_int'

class TestRoman < Test::Unit::TestCase

  attr_accessor :converter

  def setup
    @converter = RomanInt.new
  end

  def test_valid_token
    # Soon.
    random_nr = Random.rand(2**16)
    roman_nr = converter.int_to_roman(random_nr)
    puts "Conversion of #{random_nr} yields " + roman_nr.to_s

    # Smells, but works
    valid_token = !roman_nr.match(/[^IVXLCDM\*\s]+/i)
    assert(valid_token, "Non-roman number generated!")
  end

#  def test_

  # Very useful test case: This caused me to discover that one element was
  # missing from valid_numerals.
  def test_tokens_int_roman
    assert_equal(converter.int_to_roman(0),     "")
    assert_equal(converter.int_to_roman(1),    "I")
    assert_equal(converter.int_to_roman(4),   "IV")
    assert_equal(converter.int_to_roman(5),    "V")
    assert_equal(converter.int_to_roman(9),   "IX")
    assert_equal(converter.int_to_roman(10),   "X")
    assert_equal(converter.int_to_roman(40),  "XL")
    assert_equal(converter.int_to_roman(50),   "L")
    assert_equal(converter.int_to_roman(90),  "XC")
    assert_equal(converter.int_to_roman(100),  "C")
    assert_equal(converter.int_to_roman(400), "CD")
    assert_equal(converter.int_to_roman(500),  "D")
    assert_equal(converter.int_to_roman(900), "CM")
    assert_equal(converter.int_to_roman(1000), "M")
  end

  def test_tokens_roman_int
    assert_equal( 1, converter.roman_to_int("I"))
    assert_equal( 4, converter.roman_to_int("IV"))
    assert_equal( 5, converter.roman_to_int("V"))
    assert_equal( 9, converter.roman_to_int("IX"))
    assert_equal(10, converter.roman_to_int("X"))
    assert_equal(40, converter.roman_to_int("XL"))
    assert_equal(50, converter.roman_to_int("L"))
    assert_equal(60, converter.roman_to_int("XC"))
    assert_equal(100, converter.roman_to_int("C"))
    assert_equal(400, converter.roman_to_int("CD"))
    assert_equal(500, converter.roman_to_int("D"))
    assert_equal(900, converter.roman_to_int("CM"))
    assert_equal(1000, converter.roman_to_int("M"))
  end

  # Brute force validation over your machine's MAXINT. Have fun.
  #def test_transform_all_and_back
    #(2**32).times { |i|
      #assert_equal(i, converter.int_to_roman(converter.roman_to_int(i)))
    #}
  #end
end
