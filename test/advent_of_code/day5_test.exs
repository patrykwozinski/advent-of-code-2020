defmodule AdventOfCodeTest.Day5Test do
  use ExUnit.Case

  alias AdventOfCode.Day5

  describe "Part 1 of the boarding" do
    test "short list highest seat ID is 820" do
      assert Day5.part1("test/fixtures/day5/short.txt") == 820
    end

    test "full list highest seat ID is 989" do
      assert Day5.part1("test/fixtures/day5/full.txt") == 989
    end
  end

  describe "Part 2 of the boarding" do
    test "my seat ID on full list is X" do
      assert Day5.part2("test/fixtures/day5/short.txt") == 0
    end

    # test "my seat ID on full list is X" do
    #   assert Day5.part2("test/fixtures/day5/full.txt") == 0
    # end
  end
end
