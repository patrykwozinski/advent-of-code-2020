defmodule AdventOfCode.Day4Part1 do
  def calculate(file_path) do
    File.read!(file_path)
    |> String.split("\n\n", trim: true)
    |> Enum.map(fn passport ->
      passport
      |> String.split("\n", trim: true)
      |> Enum.flat_map(&String.split(&1))
    end)
    # |> Enum.filter(&(is_required(&1)))
    |> Enum.filter(&(all_required_fields?(&1)))
    |> Enum.count()
  end

  defp all_required_fields?(document) do

  end

  defp is_required(data) do
    case data do
      "byr" <> _ -> true
      "iyr" <> _ -> true
      "eyr" <> _ -> true
      "hgt" <> _ -> true
      "hcl" <> _ -> true
      "ecl" <> _ -> true
      "pid" <> _ -> true
      "cid" <> _ -> true
      _ -> false
    end
  end
end
