def EightBitAdder(a, b)
  result = []

  FullAdder(a.pop, b.pop, 0) do |carry_out, sum|
    result.unshift(sum)
    FullAdder(a.pop, b.pop, carry_out) do |carry_out, sum|
      result.unshift(sum)
      FullAdder(a.pop, b.pop, carry_out) do |carry_out, sum|
        result.unshift(sum)
        FullAdder(a.pop, b.pop, carry_out) do |carry_out, sum|
          result.unshift(sum)
          FullAdder(a.pop, b.pop, carry_out) do |carry_out, sum|
            result.unshift(sum)
            FullAdder(a.pop, b.pop, carry_out) do |carry_out, sum|
              result.unshift(sum)
              FullAdder(a.pop, b.pop, carry_out) do |carry_out, sum|
                result.unshift(sum)
                FullAdder(a.pop, b.pop, carry_out) do |carry_out, sum|
                  result.unshift(sum)
                  result.unshift(carry_out)

                  if block_given?
                    yield result
                  else
                    result
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
