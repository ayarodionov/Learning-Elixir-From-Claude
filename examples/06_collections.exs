n = 0
IO.inspect(for(i <- 1..n, do: i), label: "for i <- 1..0")
IO.inspect(for(i <- 1..n//1, do: i), label: "for i <- 1..0//1")

list = Enum.to_list(1..20_000)
{t1, _} = :timer.tc(fn -> for i <- 0..(length(list) - 1), do: Enum.at(list, i) end)
{t2, _} = :timer.tc(fn -> Enum.map(list, & &1) end)
IO.puts("Enum.at loop: #{div(t1, 1000)} ms, Enum.map: #{div(t2, 1000)} ms")
{t3, _} = :timer.tc(fn -> Enum.reduce(list, [], fn x, acc -> acc ++ [x] end) end)
{t4, _} = :timer.tc(fn -> Enum.reduce(list, [], fn x, acc -> [x | acc] end) |> Enum.reverse() end)
IO.puts("acc ++ [x]: #{div(t3, 1000)} ms, prepend+reverse: #{div(t4, 1000)} ms")

counter = :counters.new(1, [])
s = Stream.map(1..3, fn x -> :counters.add(counter, 1, 1); x end)
Enum.sum(s); Enum.count(s)
IO.inspect(:counters.get(counter, 1), label: "stream side effects after two uses (3 items)")

m = %{"zeta" => 1, "alpha" => 2, "mid" => 3}
IO.inspect(Map.keys(m), label: "map key order")
{t5, _} = :timer.tc(fn -> 1..100_000 |> Stream.map(&(&1 * 2)) |> Stream.filter(&(rem(&1, 3) == 0)) |> Enum.sum() end)
{t6, _} = :timer.tc(fn -> 1..100_000 |> Enum.map(&(&1 * 2)) |> Enum.filter(&(rem(&1, 3) == 0)) |> Enum.sum() end)
IO.puts("100k: Stream #{t5} us, Enum #{t6} us")
