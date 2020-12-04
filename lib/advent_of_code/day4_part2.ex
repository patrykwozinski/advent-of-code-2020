defmodule AdventOfCode.Day4Part2 do
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
    has_byr = not is_nil(document["byr"]) and document["byr"] |> between?(1920, 2002)
    has_iyr = not is_nil(document["iyr"]) and document["iyr"] |> between?(2010, 2020)
    has_eyr = not is_nil(document["eyr"]) and document["eyr"] |> between?(2020, 2030)
    has_hgt = not is_nil(document["hgt"]) and document["hgt"] |> valid_height?()
    has_hcl = not is_nil(document["hcl"]) and document["hcl"] |> valid_hair_color?()
    has_ecl = not is_nil(document["ecl"]) and document["ecl"] |> valid_eye_color?()
    has_pid = not is_nil(document["pid"]) and document["pid"] |> valid_passport_id?()

    has_byr and has_iyr and has_eyr and has_hgt and has_hcl and has_ecl and has_pid
  end

  defp between?(year, from, to) when is_binary(year),
    do: String.to_integer(year) |> between?(from, to)

  defp between?(year, from, to) when is_integer(year), do: year in from..to

  defp valid_height?(full_height) do
    case Integer.parse(full_height) do
      {height, "in"} when height in 59..76 -> true
      {height, "cm"} when height in 150..193 -> true
      _ -> false
    end
  end

  defp valid_hair_color?(hair_color), do: String.match?(hair_color, ~r/^#[0-9a-f]{6}$/)

  defp valid_eye_color?(eye_color), do: eye_color in ~w(amb blu brn gry grn hzl oth)

  defp valid_passport_id?(passport_id), do: String.match?(passport_id, ~r/^[0-9]{9}$/)
end
