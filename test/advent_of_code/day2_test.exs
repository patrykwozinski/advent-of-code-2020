defmodule AdventOfCodeTest.Day2Test do
  use ExUnit.Case

  alias AdventOfCode.Day2Part1
  alias AdventOfCode.Day2Part2

  describe "Part 1 of the task" do
    test "short data set should contain exactly two valid passwords" do
      assert Day2Part1.calculate("test/fixtures/day2/short.txt") == 2
    end

    test "full data set should contain 546 valid passwords" do
      assert Day2Part1.calculate("test/fixtures/day2/full.txt") == 546
    end
  end

  describe "Part 2 of the task" do
    test "short data should contain one valid password" do
      assert Day2Part2.calculate("test/fixtures/day2/short.txt") == 1
    end

    test "full data should contain 275 valid password" do
      assert Day2Part2.calculate("test/fixtures/day2/full.txt") == 275
    end
  end
end
