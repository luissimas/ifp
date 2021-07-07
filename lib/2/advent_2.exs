defmodule Advent2 do
  def solution(input) do
    input
    |> parse_input
    |> Enum.map(&valid_password?/1)
    |> Enum.filter(& &1)
    |> Enum.count()
  end

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

  defp in_range?({_, count}, min, max) when count >= min and count <= max, do: true
  defp in_range?(_, _, _), do: false

  # Parses the input when it is a list
  defp parse_input(input) when is_list(input) do
    input
    |> Enum.map(fn element -> String.split(element) end)
  end

  # Parses the input when it is a single string
  defp parse_input(input) when is_bitstring(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn element -> String.split(element) end)
  end

  defp parse_input(_), do: {:error, "Invalid input format"}

  # Parses the "x-y" part of the input
  defp parse_range(input) do
    [min, max] = String.split(input, "-")

    {String.to_integer(min), String.to_integer(max)}
  end
end

{:ok, input} = File.read("input_2.txt")

my_input = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]

IO.inspect(Advent2.solution(input))
IO.inspect(Advent2.solution(my_input))
IO.inspect(Advent2.solution("1-3 a: abcde"))
IO.inspect(Advent2.solution("1-3 b: cdefg"))
