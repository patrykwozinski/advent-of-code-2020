defmodule AdventOfCodeTest.Day1Test do
  use ExUnit.Case

  alias AdventOfCode.Day1

  test "the numbers multiply should equals 800139" do
    assert Day1.calc() == 800139
  end
end
