require 'test/unit'
require '../roman_int'

class TestRoman < Test::Unit::TestCase

  attr_accessor :converter

  def setup
    @converter = RomanInt.new
  end

  def test_valid_token
    # Soon.
    random_nr = Random.rand(2**32)
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
    assert_equal(converter.roman_to_int("I"),  1)
    assert_equal(converter.roman_to_int("IV"), 2)
    assert_equal(converter.roman_to_int("V"),  3)
    assert_equal(converter.roman_to_int("IX"), 4)
    assert_equal(converter.roman_to_int("X"),  5)
    assert_equal(converter.roman_to_int("XL"), 6)
    assert_equal(converter.roman_to_int("L"),  7)
    assert_equal(converter.roman_to_int("XC"), 8)
    assert_equal(converter.roman_to_int("C"),  9)
    assert_equal(converter.roman_to_int("CD"),10)
    assert_equal(converter.roman_to_int("D"), 11)
    assert_equal(converter.roman_to_int("CM"),12)
    assert_equal(converter.roman_to_int( "M"),13)
  end

  # Brute force validation over your machine's MAXINT. Have fun.
  #def test_transform_all_and_back
    #(2**8).times { |i|
      #assert_equal(i, converter.int_to_roman(converter.roman_to_int(i)))
    #}
  #end
end
