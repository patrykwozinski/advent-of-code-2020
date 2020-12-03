defmodule AdventOfCode.Day3Part1 do
  @position_move 3
  def calculate(file_path) do
    {_, trees} = file_path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.to_list()
    |> Enum.reduce({0, 0}, fn line, {position, trees} ->
      meet_tree = String.at(line, position) == "#"
      trees = if meet_tree, do: trees + 1, else: trees
      position = rem(position + @position_move, String.length(line))

      {position, trees}
    end)

    trees
  end
end
