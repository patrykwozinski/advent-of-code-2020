defmodule AdventOfCode.Day4Part2 do
  def calculate(file_path) do
    File.read!(file_path)
    |> String.split("\n\n", trim: true)
    |> Enum.map(fn passport ->
      passport
      |> String.split("\n", trim: true)
      |> Enum.flat_map(&String.split(&1))
    end)
    |> Enum.filter(&all_required_fields?(&1))
    |> Enum.count()
  end

  defp all_required_fields?(document) do
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
          "hgt:" <> detail -> true
          _ -> false
        end
      end)

    has_hcl =
      Enum.any?(document, fn data ->
        case data do
          "hcl:" <> detail -> true
          _ -> false
        end
      end)

    has_ecl =
      Enum.any?(document, fn data ->
        case data do
          "ecl:" <> detail -> true
          _ -> false
        end
      end)

    has_pid =
      Enum.any?(document, fn data ->
        case data do
          "pid:" <> detail -> true
          _ -> false
        end
      end)

    has_byr and has_iyr and has_eyr and has_hgt and has_hcl and has_ecl and has_pid
  end

  defp between?(year, from, to) when is_binary(year) do
    String.to_integer(year) |> between?(from, to)
  end

  defp between?(year, from, to) when is_integer(year) do
    year in from..to
  end
end
