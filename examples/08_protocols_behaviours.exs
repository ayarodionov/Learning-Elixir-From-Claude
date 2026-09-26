defmodule Account do
  defstruct [:email, :password_hash, :api_token]
end
defmodule SafeAccount do
  @derive {Inspect, except: [:password_hash, :api_token]}
  defstruct [:email, :password_hash, :api_token]
end
fields = [email: "a@b.c", password_hash: "$2b$...", api_token: "sk_live_123"]
IO.puts("default inspect: " <> inspect(struct(Account, fields)))
IO.puts("derived inspect: " <> inspect(struct(SafeAccount, fields)))

defmodule Typo do
  use GenServer
  def init(s), do: {:ok, s}
  def handle_cal(:ping, _from, s), do: {:reply, :pong, s}
end
Process.flag(:trap_exit, true)
{:ok, p} = GenServer.start_link(Typo, nil)
try do
  GenServer.call(p, :ping)
catch :exit, {reason, _} -> IO.inspect(elem(reason, 0), label: "call with typo'd handle_call")
end

defmodule Order do
  defstruct items: [], total: 0
end
try do
  Enum.map(struct(Order), & &1)
rescue e -> IO.inspect(e.__struct__, label: "Enum.map over a struct")
end
