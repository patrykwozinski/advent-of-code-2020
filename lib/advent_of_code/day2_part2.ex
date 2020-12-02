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
      at_position?(char, x, password) != at_position?(char, y, password)
    end)
    |> Enum.count()
  end

  defp at_position?(char, position, password) do
    String.at(password, String.to_integer(position) - 1) == char
  end
end
