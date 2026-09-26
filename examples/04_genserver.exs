defmodule Ticker do
  use GenServer
  def start_link(_), do: GenServer.start_link(__MODULE__, 0)
  def init(n), do: {:ok, n}
  def handle_info(:tick, n), do: {:noreply, n + 1}
end
Process.flag(:trap_exit, true)
{:ok, p} = Ticker.start_link(nil)
send(p, :unexpected)
receive do
  {:EXIT, ^p, {reason, _}} -> IO.inspect(reason, label: "own handle_info + stray message")
after 500 -> IO.puts("survived")
end

defmodule Cache do
  use GenServer
  def start_link(_), do: GenServer.start_link(__MODULE__, %{a: 1}, name: __MODULE__)
  def get(k), do: GenServer.call(__MODULE__, {:get, k})
  def refresh, do: GenServer.cast(__MODULE__, :refresh)
  def init(s), do: {:ok, s}
  def handle_call({:get, k}, _from, s), do: {:reply, Map.get(s, k), s}
  def handle_cast(:refresh, s) do
    _old = get(:a)          # client API called from inside the server
    {:noreply, s}
  end
end
{:ok, c} = Cache.start_link(nil)
Cache.refresh()
receive do
  {:EXIT, ^c, reason} -> IO.inspect(elem(reason, 0), label: "calling own client API")
after 7000 -> IO.puts("no exit")
end
