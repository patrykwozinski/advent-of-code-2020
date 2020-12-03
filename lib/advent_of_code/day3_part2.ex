defmodule AdventOfCode.Day3Part2 do
  def calculate(file_path) do
    forest =
      file_path
      |> File.stream!()
      |> Stream.map(&String.replace(&1, "\n", ""))
      |> Enum.to_list()

      [{1, 1}, {1, 3}, {1, 5}, {1, 7}, {2, 1}]
      |> Enum.map(&(analyse_for_slope(forest, &1)))
      |> Enum.reduce(&(&1 * &2))
  end

  defp analyse_for_slope(forest, {move_down, move_right}) do
    {_, trees} =
      Enum.zip(0..Enum.count(forest), forest)
      |> Enum.filter(fn {line_number, _} -> rem(line_number, move_down) == 0 end)
      |> Enum.reduce({0, 0}, fn {_, line}, {position, trees} ->
        meet_tree = String.at(line, position) == "#"
        trees = if meet_tree, do: trees + 1, else: trees
        position = rem(position + move_right, String.length(line))

        {position, trees}
      end)

    trees
  end
end
