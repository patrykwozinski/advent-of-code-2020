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
    |> Enum.filter(&all_required_fields?(&1))
    |> Enum.count()
  end

  defp all_required_fields?(document) do
    has_byr =
      Enum.any?(document, fn data ->
        case data do
          "byr" <> _ -> true
          _ -> false
        end
      end)

    has_iyr =
      Enum.any?(document, fn data ->
        case data do
          "iyr" <> _ -> true
          _ -> false
        end
      end)

    has_eyr =
      Enum.any?(document, fn data ->
        case data do
          "eyr" <> _ -> true
          _ -> false
        end
      end)

    has_hgt =
      Enum.any?(document, fn data ->
        case data do
          "hgt" <> _ -> true
          _ -> false
        end
      end)

    has_hcl =
      Enum.any?(document, fn data ->
        case data do
          "hcl" <> _ -> true
          _ -> false
        end
      end)

    has_ecl =
      Enum.any?(document, fn data ->
        case data do
          "ecl" <> _ -> true
          _ -> false
        end
      end)

    has_pid =
      Enum.any?(document, fn data ->
        case data do
          "pid" <> _ -> true
          _ -> false
        end
      end)

    has_byr and has_iyr and has_eyr and has_hgt and has_hcl and has_ecl and has_pid
  end
end