defmodule AdventOfCodeTest.Day2Test do
  use ExUnit.Case

  alias AdventOfCode.Day2

  test "should be calculated how many passwords is valid" do
    assert Day2.calculate("test/fixtures/day2/short.txt") == 2
  end
end
