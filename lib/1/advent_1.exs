defmodule Advent1 do
  def solution([]), do: nil

  def solution([head | tail]) do
    filtered = Enum.filter(tail, fn element -> head + element == 2020 end)

    case filtered do
      [] -> solution(tail)
      _ -> head * hd(filtered)
    end
  end
end

IO.puts("Advent of Code Day 1 2020")

input1 = [1721, 979, 366, 299, 675, 1456]
input2 = [2010, 123_904_120, 21093, 1_239_402_013, 1239, 10, 34289]
input3 = [1, 123_904_120, 21093, 1_239_402_013, 2019, 10, 34289]
input4 = [2, 123_904_120, 21093, 1_239_402_013, 2019, 10, 34289]

IO.puts("The first input list is #{inspect(input1)}")
IO.puts("The result for the first input is #{inspect(Advent1.solution(input1))}")
IO.puts("The second input list is #{inspect(input2)}")
IO.puts("The result for the second input is #{inspect(Advent1.solution(input2))}")
IO.puts("The third input list is #{inspect(input3)}")
IO.puts("The result for the third input is #{inspect(Advent1.solution(input3))}")
IO.puts("The forth input list is #{inspect(input4)}")
IO.puts("The result for the forth input is #{inspect(Advent1.solution(input4))}")
