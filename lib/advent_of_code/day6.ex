defmodule AdventOfCode.Day6 do
  def part1(file_path) do
    file_path
    |> read_all_answers()
    |> Enum.map(&answers(&1, :anyone))
    |> Enum.sum()
  end

  def part2(file_path) do
    file_path
    |> read_all_answers()
    |> Enum.map(&answers(&1, :everyone))
    |> Enum.sum()
  end

  defp read_all_answers(file_path) do
    File.read!(file_path)
    |> String.split("\n\n", trim: true)
    |> Enum.map(&String.split/1)
  end

  defp answers(list, :anyone), do: answers(list, &MapSet.union/2)
  defp answers(list, :everyone), do: answers(list, &MapSet.intersection/2)

  defp answers(list, f) do
    list
    |> Enum.map(&String.to_charlist/1)
    |> Enum.map(&MapSet.new/1)
    |> Enum.reduce(f)
    |> Enum.count()
  end
end
