# Takes a carry in bit and two input bits and returns
# the sum of all three and the new carry over
def FullAdder a, b, carry_in
  HalfAdder(a, b) do |first_carry_out, first_sum|
    HalfAdder(carry_in, first_sum) do |final_carry_out, final_sum|
      if block_given?
        yield [OR(first_carry_out, final_carry_out), final_sum]
      else
        [OR(first_carry_out, final_carry_out), final_sum]
      end
    end
  end
end
