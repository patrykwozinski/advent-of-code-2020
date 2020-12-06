defmodule AdventOfCode.Day6 do
  def part1(file_path) do
    file_path
    |> read_all_answers()
    |> Enum.map(&how_many_answers(&1, :step1))
    |> Enum.sum()
  end

  def part2(file_path) do
    file_path
    |> read_all_answers()
    |> Enum.map(&how_many_answers(&1, :step2))
    |> Enum.sum()
  end

  defp read_all_answers(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n\n", trim: true)
    |> Enum.map(&String.split/1)
  end

  defp how_many_answers(list, :step1), do: how_many_answers(list, &MapSet.union/2)
  defp how_many_answers(list, :step2), do: how_many_answers(list, &MapSet.intersection/2)

  defp how_many_answers(list, f) do
    list
    |> Enum.map(&String.to_charlist/1)
    |> Enum.map(&MapSet.new/1)
    |> Enum.reduce(f)
    |> Enum.count()
  end
end
