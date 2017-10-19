defmodule Addition do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

IO.puts Addition.sum(5)
IO.puts Addition.gcd(281283182, 732717292)
