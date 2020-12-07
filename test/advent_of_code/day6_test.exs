defmodule AdventOfCodeTest.Day6Test do
  use ExUnit.Case

  alias AdventOfCode.Day6

  describe "Part 1 of the custom customs" do
    test "short list contain different 11 answers" do
      assert Day6.part1("test/fixtures/day6/short.txt") == 11
    end

    test "full list contain different 6662 answers" do
      assert Day6.part1("test/fixtures/day6/full.txt") == 6662
    end
  end

  describe "Part 2 of the custom customs" do
    test "short list contain 6 same answers in group" do
      assert Day6.part2("test/fixtures/day6/short.txt") == 6
    end

    test "full list contain x same answers in group" do
      assert Day6.part2("test/fixtures/day6/full.txt") == 3382
    end
  end
end
