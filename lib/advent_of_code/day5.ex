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
    row_end = mid(row_start, row_end) |> floor()
    seat_id(rest, {row_start, row_end}, column)
  end

  defp seat_id(["B" | rest], {row_start, row_end}, column) do
    row_start = mid(row_start, row_end) |> round()
    seat_id(rest, {row_start, row_end}, column)
  end

  defp seat_id(["L" | rest], row, {column_start, column_end}) do
    column_end = mid(column_start, column_end) |> floor()
    seat_id(rest, row, {column_start, column_end})
  end

  defp seat_id(["R" | rest], row, {column_start, column_end}) do
    column_start = mid(column_start, column_end) |> round()
    seat_id(rest, row, {column_start, column_end})
  end

  defp seat_id([], {row, _}, {column, _}) do
    {row, column}

    row * 8 + column
  end

  defp mid(lower, higher) do
    (higher - lower)
    |> Kernel./(2)
    |> Kernel.+(lower)
  end

  defp reserved?(i, reserved) do
    (i - 1) in reserved and (i + 1) in reserved and i not in reserved
  end
end
