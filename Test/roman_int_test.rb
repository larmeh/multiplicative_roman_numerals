require 'test/unit'
require 'roman_int'

class TestRoman < Test::Unit::TestCase

  attr_accessor :converter

  def setup
    @converter = RomanInt.new
  end

  def test_valid_token
    roman_nr = "XIIR"
    # Soon.
    #random_nr = Random.rand(2**32)
    #roman_nr = converter.int_to_roman(random_nr)

    # Smells, but works
    valid_token = !roman_nr.match(/[^IVXLCDM\*\s]+/i)
    assert(valid_token, "Non-roman number generated!")
  end

  def test_transform_all_and_back
    (2**8).times { |i|
      assert_equal(i, converter.int_to_roman(converter.roman_to_int(i)))
    }
  end
end
