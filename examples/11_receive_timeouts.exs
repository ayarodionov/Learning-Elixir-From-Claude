ExUnit.start(seed: 0)
defmodule ReceiveTest do
  use ExUnit.Case
  test "refute_receive passes although the message comes later" do
    me = self()
    spawn(fn -> Process.sleep(300); send(me, :email_sent) end)
    refute_receive :email_sent
    assert_receive :email_sent, 1000   # it did arrive
  end
  test "assert_receive default timeout is short" do
    me = self()
    spawn(fn -> Process.sleep(300); send(me, :done) end)
    assert_receive :done
  end
end
defmodule Srv do
  use GenServer
  def start_link(_), do: GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  def init(s), do: {:ok, s}
end
defmodule LeakTest do
  use ExUnit.Case
  test "a" do
    {:ok, _} = Srv.start_link(nil)
  end
  test "b" do
    assert {:ok, _} = Srv.start_link(nil)
  end
end
