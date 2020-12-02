defmodule AdventOfCode.Day2 do
  @pattern ~r/(?<min>\d*)-(?<max>\d*)\s(?<char>\w):\s*(?<password>\w*)/

  def part1(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(fn line ->
      Regex.named_captures(@pattern, line)
    end)
    |> Stream.filter(fn %{"char" => char, "min" => min, "max" => max, "password" => password} ->
      occurrences =
        password
        |> String.graphemes()
        |> Enum.count(&(&1 == char))

      occurrences >= String.to_integer(min) and occurrences <= String.to_integer(max)
    end)
    |> Enum.count()
  end

  def part2(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(fn line ->
      Regex.named_captures(@pattern, line)
    end)
    |> Enum.count()
  end
end
