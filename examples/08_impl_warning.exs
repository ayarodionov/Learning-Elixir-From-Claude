defmodule Typo2 do
  use GenServer
  @impl true
  def init(s), do: {:ok, s}
  @impl true
  def handle_cal(:ping, _from, s), do: {:reply, :pong, s}
end
