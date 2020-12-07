defmodule AdventOfCodeTest.Day7Test do
  use ExUnit.Case

  alias AdventOfCode.Day7

  describe "Part 1 of the bags check" do
    test "shiny gold bag could might be in 4 bags in short list" do
      assert Day7.part1("test/fixtures/day7/short.txt") == 4
    end

    test "shiny gold bag could might be in 128 bags in full list" do
      assert Day7.part1("test/fixtures/day7/full.txt") == 128
    end
  end
end
