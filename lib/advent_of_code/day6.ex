defmodule AdventOfCode.Day6 do
  def part1(file_path) do
    file_path
    |> read_groups()
    |> Enum.map(&count_unique_yes(&1))
    |> Enum.sum()
  end

  def part2(file_path) do
    file_path
    |> read_groups()
    |> Enum.map(&count_all_yes(&1))
  end

  defp read_groups(file_path) do
    file_path
    |> File.stream!()
    |> Stream.chunk_by(&(&1 == "\n"))
    |> Stream.filter(&(&1 != ["\n"]))
    |> Stream.map(fn group ->
      Enum.map(group, &(String.replace(&1, "\n", "") |> String.graphemes()))
    end)
    |> Enum.to_list()
  end

  defp count_unique_yes(group) do
    group
    |> Enum.flat_map(& &1)
    |> Enum.uniq()
    |> Enum.count()
  end

  defp count_all_yes(group) do
    group
    |> IO.inspect()
  end
end
