defmodule AdventOfCodeTest.Day3Test do
  use ExUnit.Case

  alias AdventOfCode.Day3Part1

  describe "Part 1 of the task" do
    test "the toboggan should meet 7 trees" do
      assert Day3Part1.calculate("test/fixtures/day3/short.txt") == 7
    end

    test "the toboggan should meet x trees" do
      assert Day3Part1.calculate("test/fixtures/day3/full.txt") == 274
    end
  end
end
