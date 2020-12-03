defmodule AdventOfCodeTest.Day3Test do
  use ExUnit.Case

  alias AdventOfCode.Day3Part1
  alias AdventOfCode.Day3Part2

  describe "Part 1 of the small forest" do
    test "the toboggan should meet 7 trees" do
      assert Day3Part1.calculate("test/fixtures/day3/short.txt") == 7
    end

    test "the toboggan should meet 274 trees for full forest" do
      assert Day3Part1.calculate("test/fixtures/day3/full.txt") == 274
    end
  end

  describe "Part 2 of the task" do
    test "the toboggan should meet 336 trees with 5 slopes" do
      assert Day3Part2.calculate("test/fixtures/day3/short.txt") == 336
    end
  end
end
