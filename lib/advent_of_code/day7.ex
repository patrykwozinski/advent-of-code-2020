defmodule AdventOfCode.Day7 do
  @bags ~r/\A(\d) (\w+ \w+).*\z/
  @type_required "shiny gold"

  def part1(file_path) do
    file_path
    |> read_bag_list()
    |> invert_list()
    |> search_type(@type_required)
    |> Enum.count()
  end

  def part2(_file_path) do
  end

  defp read_bag_list(file_path) do
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
    Enum.reduce(list, %{}, fn {parent, children}, bags ->
      Enum.reduce(children, bags, fn {_n, child}, bags ->
        Map.update(bags, child, [parent], &[parent | &1])
      end)
    end)
  end

  def search_type(all_bags, name), do: search_type([name], MapSet.new(), all_bags)

  def search_type([], found, _all_bags), do: found

  def search_type([bag | rest], found, all_bags) do
    case Map.fetch(all_bags, bag) do
      :error -> search_type(rest, found, all_bags)
      {:ok, bags} -> search_type(bags ++ rest, MapSet.union(found, MapSet.new(bags)), all_bags)
    end
  end
end
