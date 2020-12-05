defmodule AdventOfCodeTest.Day5Test do
  use ExUnit.Case

  alias AdventOfCode.Day5

  describe "Part 1 of the boarding" do
    test "short list highest seat ID is 820" do
      assert Day5.part1("test/fixtures/day5/short.txt") == 820
    end
  end
end
