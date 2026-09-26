defmodule Conn do
  use GenServer
  def start_link(n), do: GenServer.start_link(__MODULE__, n)
  def init(n), do: {:ok, n}
  def handle_cast(:bad_input, _), do: raise "boom"
end
Process.flag(:trap_exit, true)
{:ok, sup} = DynamicSupervisor.start_link(strategy: :one_for_one)
pids = for i <- 1..1000 do {:ok, p} = DynamicSupervisor.start_child(sup, {Conn, i}); p end
Logger.configure(level: :none)
for p <- Enum.take(pids, 4), do: GenServer.cast(p, :bad_input)
Process.sleep(300)
IO.inspect(Process.alive?(sup), label: "DynamicSupervisor alive after 4 crashes among 1000")
IO.inspect(Enum.count(pids, &Process.alive?/1), label: "healthy children still alive")

defmodule W do
  use GenServer
  def start_link(a), do: GenServer.start_link(__MODULE__, a)
  def init(a), do: {:ok, a}
end
r = Supervisor.start_link([{W, :a}, {W, :b}], strategy: :one_for_one)
IO.inspect(r |> elem(0), label: "two children, same module")
{:ok, _} = Supervisor.start_link([Supervisor.child_spec({W, :a}, id: :a), Supervisor.child_spec({W, :b}, id: :b)], strategy: :one_for_one)
IO.puts("with explicit ids: ok")
