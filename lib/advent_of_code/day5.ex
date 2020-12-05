defmodule AdventOfCode.Day5 do
  def part1(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(fn bp ->
      bp
      |> String.graphemes()
      |> seat_id({0, 127}, {0, 7})
    end)
    |> Enum.max()
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
end
