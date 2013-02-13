class RomanInt
  attr_reader :terminals

  def initialize
    @terminals = {"M" => 1000, "CM" => 900, "D" => 500, "CD" => 400,
      "C" => 100, "XC" => 90, "L" => 50,"XL" => 40, "X" => 10, "IX" => 9,
      "V" => 5, "IV" => 4, "I" => 1, "*M " => 1000}
  end

  def roman_to_int(input)
    result = 0
    input.split("").each do 

    end

    return result
  end

  def int_to_roman(input)
    result = ""

    @terminals.each_pair{|key,val|
      if (x = input/val) > 0 then
        x.times do
          result += key.to_s
        end

        #puts input.to_s + "/" + val.to_s + " ~= " + x.to_s
        input -= x*val
        #puts " R " + input.to_s
      end
    }

    result
  end

  private
  def factorize(number)

  end
end
