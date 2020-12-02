defmodule AdventOfCode.Day2 do
  @pattern ~r/(?<min>\d)-(?<max>\d)\s(?<char>\w)/

  def calculate(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&(String.replace(&1, "\n", "")))
    |> Stream.map(fn line ->
      Regex.named_captures(@pattern, line) |> IO.inspect()
    end)
    |> Enum.take(1)
  end
end
