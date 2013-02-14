class MultRomanNum
  attr_reader :terminals, :special

  def initialize
    @special = [["CM", 900], ["CD" ,  400], ["XC" ,  90], ["XL" ,  40],
      ["IX" ,  9], ["IV" ,  4]]
    @terminals = [["M" ,  1000], ["D" ,  500], ["C" ,  100], ["L" ,  50],
      ["X" ,  10], ["V" ,  5], ["I" ,  1]]
    @multiplier = [["* " ,  0]]
    @lang = @terminals.concat(@special).sort{ |x,y|
      y[1] <=> x[1]
    }
  end

  def roman_to_int(input)
    result = 0
    inputArr = input.split("")

    lookahead = []
    inputArr.each_with_index do |val, i|
      if lookahead != []
        lookahead = []
        next
      end

      if input[i+1] != nil
        conc = val + input[i+1]
        lookahead = @special.select{
          |s| s.include? conc
        }
      end

      if lookahead != []
        result += lookahead[0][1]
      else
        result += @terminals.select{
          |s| s.include? val
        }[0][1]
      end
    end

    result
  end

  def int_to_roman(input)
    result = ""

    @lang.each_index{ |i|
      val = @lang[i][1]
      key = @lang[i][0]
      x = input/val
      if x > 0
        x.times do
          result += key.to_s
        end
        input -= x*val
      end
    }

    result
  end
end
