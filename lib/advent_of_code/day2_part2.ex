defmodule AdventOfCode.Day2Part2 do
  @pattern ~r/(?<x>\d*)-(?<y>\d*)\s(?<char>\w):\s*(?<password>\w*)/

  def calculate(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(fn line ->
      Regex.named_captures(@pattern, line)
    end)
    |> Stream.filter(fn %{"char" => char, "x" => x, "y" => y, "password" => password} ->
      occurrences =
        password
        |> String.graphemes()
        |> Enum.count(&(&1 == char))

      occurrences >= String.to_integer(x) and occurrences <= String.to_integer(y)
    end)
    |> Enum.count()
  end
end
