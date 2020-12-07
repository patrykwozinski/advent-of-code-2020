defmodule AdventOfCode.Day7 do
  @bags ~r/\A(\d) (\w+ \w+).*\z/

  def part1(file_path) do
    lines =
      file_path
      |> read_lines()
      |> Enum.map(&prepare_contained/1)
  end

  def part2(_file_path) do
  end

  defp read_lines(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(fn line ->
      line
      |> String.replace(".", "")
      |> String.split(" bags contain ")
    end)
    |> Map.new(fn [bag, contained] ->
      {bag, prepare_contained(contained)}
    end)

    # |> IO.inspect()
  end

  defp prepare_contained(contained) when is_binary(contained),
    do: String.split(contained, ", ") |> prepare_contained()

  defp prepare_contained(["no other bags"]), do: []

  defp prepare_contained(contained) when is_list(contained) do
    contained
    |> Enum.map(fn bag ->
      Regex.run(@bags, bag, capture: :all_but_first)
    end)
    |> IO.inspect()
  end
end
