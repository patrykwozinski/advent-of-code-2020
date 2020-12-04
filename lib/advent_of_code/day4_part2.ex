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
    |> Enum.map(fn passport ->
      passport
      |> String.splitter("\n", trim: true)
      |> Enum.flat_map(&String.split(&1))
    end)
  end

  defp valid_passport?(document) do
    has_byr =
      Enum.any?(document, fn data ->
        case data do
          "byr:" <> year ->
            year |> between?(1920, 2002)

          _ ->
            false
        end
      end)

    has_iyr =
      Enum.any?(document, fn data ->
        case data do
          "iyr:" <> year ->
            year |> between?(2010, 2020)

          _ ->
            false
        end
      end)

    has_eyr =
      Enum.any?(document, fn data ->
        case data do
          "eyr:" <> year ->
            year |> between?(2020, 2030)

          _ ->
            false
        end
      end)

    has_hgt =
      Enum.any?(document, fn data ->
        case data do
          "hgt:" <> height -> valid_height?(height)
          _ -> false
        end
      end)

    has_hcl =
      Enum.any?(document, fn data ->
        case data do
          "hcl:" <> hair_color -> valid_hair_color?(hair_color)
          _ -> false
        end
      end)

    has_ecl =
      Enum.any?(document, fn data ->
        case data do
          "ecl:" <> eye_color -> valid_eye_color?(eye_color)
          _ -> false
        end
      end)

    has_pid =
      Enum.any?(document, fn data ->
        case data do
          "pid:" <> passport_id -> valid_passport_id?(passport_id)
          _ -> false
        end
      end)

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
