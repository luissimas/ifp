defmodule Advent2 do
  @spec solution(list() | bitstring()) :: integer()
  def solution(input) do
    input
    |> parse_input
    |> Enum.count(&valid_password?/1)
  end

  @spec valid_password?(list()) :: boolean()
  defp valid_password?([head | tail]) do
    {min, max} = parse_range(head)

    [char, password] = tail

    char = String.first(char)

    password
    |> String.graphemes()
    |> Enum.frequencies()
    |> Enum.find(fn
      {^char, _n} -> true
      {_, _} -> false
    end)
    |> then(fn x -> in_range?(x, min, max) end)
  end

  @spec parse_range(bitstring()) :: tuple()
  defp parse_range(input) do
    [min, max] = String.split(input, "-")

    {String.to_integer(min), String.to_integer(max)}
  end

  @spec in_range?(tuple(), integer(), integer()) :: boolean()
  defp in_range?({_, x}, min, max) when x >= min and x <= max, do: true
  defp in_range?(_, _, _), do: false

  @spec parse_input(list() | bitstring()) :: list()
  defp parse_input(input) when is_list(input) do
    input
    |> Enum.map(fn element -> String.split(element) end)
  end

  defp parse_input(input) when is_bitstring(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn element -> String.split(element) end)
  end

  defp parse_input(_), do: {:error, "Invalid input format"}
end

# Testing with some methods (including the puzzle file)
{:ok, input} = File.read("input_2.txt")

my_input = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]

IO.inspect(Advent2.solution(input))
IO.inspect(Advent2.solution(my_input))
IO.inspect(Advent2.solution("1-3 a: abcde"))
IO.inspect(Advent2.solution("1-3 b: cdefg"))
