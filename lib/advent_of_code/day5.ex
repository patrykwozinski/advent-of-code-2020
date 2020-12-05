defmodule AdventOfCode.Day5 do
  def part1(file_path) do
    file_path
    |> read_boarding_passes()
    |> Enum.max()
  end

  def part2(file_path) do
    reserved =
      file_path
      |> read_boarding_passes()
      |> Enum.to_list()

    0..Enum.max(reserved)
    |> Enum.to_list()
    |> Enum.filter(&reserved?(&1, reserved))
    |> List.first()
  end

  defp read_boarding_passes(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(fn bp ->
      bp
      |> String.graphemes()
      |> seat_id({0, 127}, {0, 7})
    end)
  end

  defp seat_id(["F" | rest], {row_start, row_end}, column) do
    row_end = get_between(row_start, row_end) |> floor()
    seat_id(rest, {row_start, row_end}, column)
  end

  defp seat_id(["B" | rest], {row_start, row_end}, column) do
    row_start = get_between(row_start, row_end) |> round()
    seat_id(rest, {row_start, row_end}, column)
  end

  defp seat_id(["L" | rest], row, {column_start, column_end}) do
    column_end = get_between(column_start, column_end) |> floor()
    seat_id(rest, row, {column_start, column_end})
  end

  defp seat_id(["R" | rest], row, {column_start, column_end}) do
    column_start = get_between(column_start, column_end) |> round()
    seat_id(rest, row, {column_start, column_end})
  end

  defp seat_id([], {row, _}, {column, _}) do
    {row, column}

    row * 8 + column
  end

  defp get_between(lower, higher) do
    (higher - lower) / 2 + lower
  end

  defp reserved?(current, reserved) do
    (current - 1) in reserved and (current + 1) in reserved and current not in reserved
  end
end
