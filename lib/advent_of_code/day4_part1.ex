defmodule AdventOfCode.Day4Part1 do
  def calculate(file_path) do
    file_path
    |> read_passports()
    |> Enum.filter(&valid_passport?(&1))
    |> Enum.count()
  end

  defp read_passports(file_path) do
    File.read!(file_path)
    |> String.split("\n\n", trim: true)
    |> Enum.map(&prepare_passport(&1))
  end

  defp prepare_passport(passport) do
    passport
    |> String.splitter("\n", trim: true)
    |> Enum.flat_map(&String.split(&1))
    |> Enum.into(%{}, fn field ->
      field
      |> String.split(":")
      |> List.to_tuple()
    end)
  end

  defp valid_passport?(document) do
    not is_nil(document["byr"]) and
      not is_nil(document["iyr"]) and
      not is_nil(document["eyr"]) and
      not is_nil(document["hgt"]) and
      not is_nil(document["hcl"]) and
      not is_nil(document["ecl"]) and
      not is_nil(document["pid"])
  end
end
