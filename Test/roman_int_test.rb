require 'test/unit'
require 'roman_int'

class TestRoman < Test::Unit::TestCase

    attr_accessor :roman_int

    def setup
        @roman_int = RomanInt.new
    end

    def test_transform_all_and_back
        (2**8).times { |i|
            assert_equal(roman_int.int_to_roman(i), roman_int.roman_to_int(roman_int.int_to_roman(i)))
        }
    end

end