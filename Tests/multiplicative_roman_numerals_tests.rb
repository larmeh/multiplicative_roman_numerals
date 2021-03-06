$LOAD_PATH << '.' << '../' << 'lib/'
require 'test/unit'
require 'multiplicative_roman_numerals'

class MultRomanNumTests < Test::Unit::TestCase

  attr_accessor :converter

  def setup
    @converter = MultRomanNum.new
  end

  def test_valid_token
    random_nr = Random.rand(10000)
    roman_nr = converter.int_to_roman(random_nr)

    # Smells, but works
    valid_token = !roman_nr.match(/[^IVXLCDM\*\s]+/i)
    assert(valid_token)
  end

  def test_communtative
    assert_equal(249, converter.roman_to_int("XLCCIX"))
  end

  def test_sanity_roman_int_roman
    assert_equal("MMXIII",
                 converter.int_to_roman(converter.roman_to_int("MMXIII")))
  end

  def test_sanity_int_roman_int
    nr = 2013

    assert_equal(nr,
                 converter.roman_to_int(converter.int_to_roman(nr)))
  end

  def test_tokens_int_roman
    assert_equal("", converter.int_to_roman(0))
    assert_equal( "I", converter.int_to_roman(1))
    assert_equal("IV", converter.int_to_roman(4))
    assert_equal( "V", converter.int_to_roman(5))
    assert_equal("IX", converter.int_to_roman(9))
    assert_equal( "X", converter.int_to_roman(10))
    assert_equal("XL", converter.int_to_roman(40))
    assert_equal( "L", converter.int_to_roman(50))
    assert_equal("XC", converter.int_to_roman(90))
    assert_equal( "C", converter.int_to_roman(100))
    assert_equal("CD", converter.int_to_roman(400))
    assert_equal( "D", converter.int_to_roman(500))
    assert_equal("CM", converter.int_to_roman(900))
    assert_equal( "M", converter.int_to_roman(1000))
  end

  def test_tokens_roman_int
    assert_equal(0, converter.roman_to_int(""))
    assert_equal(1, converter.roman_to_int("I"))
    assert_equal(4, converter.roman_to_int("IV"))
    assert_equal(5, converter.roman_to_int("V"))
    assert_equal(9, converter.roman_to_int("IX"))
    assert_equal(10, converter.roman_to_int("X"))
    assert_equal(40, converter.roman_to_int("XL"))
    assert_equal(50, converter.roman_to_int("L"))
    assert_equal(90, converter.roman_to_int("XC"))
    assert_equal(100, converter.roman_to_int("C"))
    assert_equal(400, converter.roman_to_int("CD"))
    assert_equal(500, converter.roman_to_int("D"))
    assert_equal(900, converter.roman_to_int("CM"))
    assert_equal(1000, converter.roman_to_int("M"))
  end

end
