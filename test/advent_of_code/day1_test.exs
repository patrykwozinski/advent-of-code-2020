defmodule AdventOfCodeTest.Day1Test do
  use ExUnit.Case

  alias AdventOfCode.Day1

  test "PART1: two numbers that sums to 2020 multiplied should give 800_139" do
    assert Day1.calc_part1() == 800_139
  end

  test "PART2: three numbers that sums to 2020 multiplied should give 59_885_340" do
    assert Day1.calc_part2() == 59_885_340
  end
end
