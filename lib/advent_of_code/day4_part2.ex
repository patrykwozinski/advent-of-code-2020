defmodule AdventOfCode.Day4Part2 do
  def calculate(file_path) do
    file_path
    |> read_passports()
    |> Enum.filter(&valid_passport?/1)
    |> Enum.count()
  end

  defp read_passports(file_path) do
    File.read!(file_path)
    |> String.split("\n\n", trim: true)
    |> Enum.map(&prepare_passport/1)
  end

  defp prepare_passport(passport) do
    passport
    |> String.splitter("\n", trim: true)
    |> Enum.flat_map(&String.split/1)
    |> Enum.into(%{}, fn field ->
      field
      |> String.split(":")
      |> List.to_tuple()
    end)
  end

  defp valid_passport?(document) do
    document["byr"] |> between?(1920, 2002) and
      document["iyr"] |> between?(2010, 2020) and
      document["eyr"] |> between?(2020, 2030) and
      document["hgt"] |> valid_height?() and
      document["hcl"] |> valid_hair_color?() and
      document["ecl"] |> valid_eye_color?() and
      document["pid"] |> valid_passport_id?()
  end

  defp between?(year, from, to) when is_binary(year),
    do: String.to_integer(year) |> between?(from, to)

  defp between?(year, from, to) when is_integer(year), do: year in from..to

  defp between?(nil, _from, _to), do: false

  defp valid_height?(full_height) when is_binary(full_height) do
    case Integer.parse(full_height) do
      {height, "in"} when height in 59..76 -> true
      {height, "cm"} when height in 150..193 -> true
      _ -> false
    end
  end

  defp valid_height?(nil), do: false

  defp valid_hair_color?(hair_color) when is_binary(hair_color),
    do: String.match?(hair_color, ~r/^#[0-9a-f]{6}$/)

  defp valid_hair_color?(nil), do: false

  defp valid_eye_color?(eye_color) when is_binary(eye_color),
    do: eye_color in ~w(amb blu brn gry grn hzl oth)

  defp valid_eye_color?(nil), do: false

  defp valid_passport_id?(passport_id) when is_binary(passport_id),
    do: String.match?(passport_id, ~r/^[0-9]{9}$/)

  defp valid_passport_id?(nil), do: false
end
