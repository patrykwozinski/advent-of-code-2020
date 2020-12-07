defmodule AdventOfCode.Day7 do
  def part1(file_path) do
    lines =
      file_path
      |> read_lines()
      |> Enum.filter(&no_empty/1)
      |> IO.inspect()
  end

  def part2(_file_path) do
  end

  defp read_lines(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(fn line ->
      line
      |> String.replace("\n", "")
      |> String.split(" bags contain ")
    end)
    |> Enum.to_list()
  end

  defp no_empty([_, "no other bags."]), do: false
  defp no_empty(_), do: true
end
