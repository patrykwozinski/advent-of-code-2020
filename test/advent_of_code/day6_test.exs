defmodule AdventOfCodeTest.Day6Test do
  use ExUnit.Case

  alias AdventOfCode.Day6

  describe "Part 1 of the custom customs" do
    test "short list contain different 11 answers" do
      assert Day6.part1("test/fixtures/day6/short.txt") == 11
    end

    # test "full list contain different x answers" do
    #   assert Day6.part1("test/fixtures/day6/full.txt") == 0
    # end
  end
end
