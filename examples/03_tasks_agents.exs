parent = self()
s = Task.async_stream([1, 2, 3], fn i -> send(parent, {:ran, i}) end)
Process.sleep(100)
IO.inspect(Process.info(self(), :message_queue_len), label: "messages after building stream")
Stream.run(s)
IO.inspect(Process.info(self(), :message_queue_len), label: "messages after Stream.run")

Process.flag(:trap_exit, true)
res = try do
  [1, 2, 3] |> Task.async_stream(fn 2 -> Process.sleep(200); 2; i -> i end, timeout: 50) |> Enum.to_list()
catch :exit, reason -> {:caller_exited, elem(reason, 0)}
end
IO.inspect(res, label: "default on_timeout")
res2 = [1, 2, 3] |> Task.async_stream(fn 2 -> Process.sleep(200); 2; i -> i end, timeout: 50, on_timeout: :kill_task) |> Enum.to_list()
IO.inspect(res2, label: "on_timeout: :kill_task")

{:ok, a} = Agent.start_link(fn -> 0 end)
for _ <- 1..100 do
  Task.async(fn -> v = Agent.get(a, & &1); Process.sleep(1); Agent.update(a, fn _ -> v + 1 end) end)
end |> Task.await_many()
IO.inspect(Agent.get(a, & &1), label: "racy get-then-update, expected 100")
