defmodule AdventOfCode.Day7 do
  def part1(file_path) do
    lines = read_lines(file_path)
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
end
