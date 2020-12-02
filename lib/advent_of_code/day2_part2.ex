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
      is_at(password, x, char) != is_at(password, y, char)
    end)
    |> Enum.count()
  end

  defp is_at(password, position, char) do
    String.at(password, String.to_integer(position) - 1) == char
  end
end
