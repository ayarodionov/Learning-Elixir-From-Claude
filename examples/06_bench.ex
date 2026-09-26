defmodule Bench6 do
  def at_loop(list), do: for(i <- 0..(length(list) - 1), do: Enum.at(list, i))
  def mapped(list), do: Enum.map(list, & &1)
  def append(list), do: Enum.reduce(list, [], fn x, acc -> acc ++ [x] end)
  def prepend(list), do: list |> Enum.reduce([], fn x, acc -> [x | acc] end) |> Enum.reverse()
  def run do
    list = Enum.to_list(1..20_000)
    for {name, f} <- [at_loop: &at_loop/1, map: &mapped/1, append: &append/1, prepend: &prepend/1] do
      {t, _} = :timer.tc(fn -> f.(list) end)
      IO.puts("#{name}: #{Float.round(t / 1000, 1)} ms")
    end
  end
end
