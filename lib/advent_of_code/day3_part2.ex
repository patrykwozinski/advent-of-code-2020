defmodule AdventOfCode.Day3Part2 do
  def calculate(file_path) do
    forest =
      file_path
      |> File.stream!()
      |> Stream.map(&String.replace(&1, "\n", ""))
      |> Enum.to_list()

      [1, 3, 5, 7, 1]
      |> Enum.map(&(analyse_for_slope(forest, &1)))
      |> Enum.reduce(&(&1 * &2))
  end

  defp analyse_for_slope(forest, move) do
    {_, trees} =
      forest
      |> Enum.reduce({0, 0}, fn line, {position, trees} ->
        meet_tree = String.at(line, position) == "#"
        trees = if meet_tree, do: trees + 1, else: trees
        position = rem(position + move, String.length(line))

        {position, trees}
      end)

    trees
  end
end
