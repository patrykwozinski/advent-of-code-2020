defmodule AdventOfCode.Day7 do
  @bags ~r/\A(\d) (\w+ \w+).*\z/

  def part1(file_path) do
    file_path
    |> read_lines()
    |> invert_list()
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
  end

  defp prepare_contained(contained) when is_binary(contained) do
    contained
    |> String.split(", ")
    |> prepare_contained()
  end

  defp prepare_contained(["no other bags"]), do: []

  defp prepare_contained(contained) do
    contained
    |> Enum.map(fn bags ->
      [no_bags, bag] = Regex.run(@bags, bags, capture: :all_but_first)

      {String.to_integer(no_bags), bag}
    end)
  end

  defp invert_list(list) do
    Enum.reduce(list, %{}, fn {parent, children}, inverted_tree ->
      Enum.reduce(children, inverted_tree, fn {_n, child}, inverted_tree ->
        Map.update(inverted_tree, child, [parent], &[parent | &1])
      end)
    end)
  end
end
