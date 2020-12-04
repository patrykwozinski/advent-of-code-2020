defmodule AdventOfCodeTest.Day4Test do
  use ExUnit.Case

  alias AdventOfCode.Day4Part1
  alias AdventOfCode.Day4Part2

  describe "Part 1 of the passport list" do
    test "short passport list should contain 2 valid passports" do
      assert Day4Part1.calculate("test/fixtures/day4/short.txt") == 2
    end

    test "short passport list should contain 210 valid passports" do
      assert Day4Part1.calculate("test/fixtures/day4/full.txt") == 210
    end
  end

  describe "Part 2 of the passport list" do
    test "short passport invalid-list should contain 0 valid passports" do
      assert Day4Part2.calculate("test/fixtures/day4/short_invalid.txt") == 0
    end

    test "short passport valid-list should contain 4 valid passports" do
      assert Day4Part2.calculate("test/fixtures/day4/short_valid.txt") == 4
    end
  end
end
