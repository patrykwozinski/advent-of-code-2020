defmodule AdventOfCodeTest.Day4Test do
  use ExUnit.Case

  alias AdventOfCode.Day4Part1
  # alias AdventOfCode.Day4Part2

  describe "Part 1 of the passport list" do
    test "short passport list should contain 2 valid passports" do
      assert Day4Part1.calculate("test/fixtures/day4/short.txt") == 2
    end

    # test "the toboggan should meet 274 trees for full forest" do
    #   assert Day4Part1.calculate("test/fixtures/day4/full.txt") == 0
    # end
  end
end
