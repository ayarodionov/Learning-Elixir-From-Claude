ExUnit.start(seed: 0, max_cases: 4)
defmodule Srv do
  use GenServer
  def start_link(_), do: GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  def init(s), do: {:ok, s}
end
for m <- [A1, A2, A3] do
  defmodule m do
    use ExUnit.Case, async: true
    test "uses the named server" do
      assert {:ok, _} = Srv.start_link(nil)
      Process.sleep(200)
    end
  end
end
defmodule EnvTest1 do
  use ExUnit.Case, async: true
  test "sets env" do
    Application.put_env(:demo, :mode, :strict)
    Process.sleep(100)
    assert Application.get_env(:demo, :mode) == :strict
  end
end
defmodule EnvTest2 do
  use ExUnit.Case, async: true
  test "sets env too" do
    Process.sleep(50)
    Application.put_env(:demo, :mode, :lenient)
    Process.sleep(100)
  end
end
